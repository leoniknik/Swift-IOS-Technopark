//
//  Person.swift
//  RAT
//
//  Created by Kirill on 3/28/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Just

final class Person {
    
    let SERVER_IP="http://192.168.43.120:8000"
    
    let SIGNUP_URL: String
    let LOGIN_URL: String
    let GET_LIST_OF_VEHICLES_URL: String
    let EDIT_USER_URL: String
    let ADD_VEHICLE_URL: String
    
    var id: Int?
    var email : String = ""
    var password : String = ""
    var firstname : String = ""
    var lastname : String = ""
    var phone : String = ""
    
    var arrayVehicles = Array<Vehicle>()
    
    private init(){
        SIGNUP_URL = "\(SERVER_IP)"+"/api/signup"
        LOGIN_URL = "\(SERVER_IP)"+"/api/signin"
        GET_LIST_OF_VEHICLES_URL = "\(SERVER_IP)"+"/api/get_list_of_vehicles"
        EDIT_USER_URL = "\(SERVER_IP)"+"/api/edit_user"
        ADD_VEHICLE_URL = "\(SERVER_IP)"+"/api/signin"
    }

    static let instance: Person = Person()

    func signUpRequest() -> Void {

        /*
        let parameters: Parameters = [
            "email": self.email,
            "password": self.password,
            "firstname": self.firstname,
            "lastname": self.lastname,
            "phone": self.phone
        ]
        */
        let parameters: Parameters = [
            "email": "leoniknik@mail.ru",
            "password": "1234",
            "firstname": "Kirill",
            "lastname": "Volodin",
            "phone": "89262805706"
        ]

        Alamofire.request(SIGNUP_URL, method: .post, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }

    func logInRequest() -> Void {
/*
        let parameters: Parameters = [
                "email": self.email,
                "password": self.password
        ]
*/
        let parameters: Parameters = [
            "email": "leoniknik@mail.ru",
            "password": "1234"
        ]
        
        let request = Just.post(LOGIN_URL, data:parameters)

        if request.ok {
            if let json = request.json as? [String:AnyObject]{
                self.id = json["user_id"] as! Int?
            }
        }
    }

    func getListOfVehiclesRequest() -> Void {
        
        let parameters: Parameters = [
            "user_id": self.id!
        ]

        Alamofire.request(GET_LIST_OF_VEHICLES_URL, method: .get, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
                let json = JSON(value)["data"].array!
                self.arrayVehicles.removeAll()
                for vehicle in json {
                    self.arrayVehicles.append(Vehicle(vehicle: vehicle))
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func editUserRequest() -> Void {
        
        let parameters: Parameters = [
            "user_id": self.id!,
            "email": self.email,
            "password": self.password,
            "firstname": self.firstname,
            "lastname": self.lastname,
            "phone": self.phone
        ]
        
        Alamofire.request(EDIT_USER_URL, method: .post, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }

 /*
    func addVehiclesRequest() -> Void {
        
        let parameters: Parameters = [
            "user_id": self.id!,
            "VIN": self.VIN,
            "number": self.number,
            "brand": self.brand,
            "model": self.model,
            "year": self.year!,
        ]
        
        Alamofire.request(ADD_VEHICLE_URL, method: .post, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
*/
    
    
}
