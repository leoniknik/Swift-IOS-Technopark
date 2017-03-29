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

final class Person {

    let SIGNUP_URL = "http://192.168.1.51:8000/api/signup"
    let LOGIN_URL = "http://192.168.1.51:8000/api/signin"
    let GET_LIST_OF_VEHICLES_URL = "http://192.168.1.51:8000/api/get_list_of_vehicles"
    let EDIT_USER_URL = "http://192.168.1.51:8000/api/edit_user"
    let ADD_VEHICLE_URL = "http://192.168.1.51:8000/api/signin"
    
    var id: Int?
    var email : String = ""
    var password : String = ""
    var firstname : String = ""
    var lastname : String = ""
    var phone : String = ""
    
    var arrayVehicles = Array<Vehicle>()
    
    private init(){
        
    }

    static let instance: Person = Person()

    func signUpRequest() -> Void {

        let parameters: Parameters = [
            "email": self.email,
            "password": self.password,
            "firstname": self.firstname,
            "lastname": self.lastname,
            "phone": self.phone
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

        let parameters: Parameters = [
                "email": self.email,
                "password": self.password
        ]

        Alamofire.request(LOGIN_URL, method: .post, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }

    func getListOfVehiclesRequest() -> Void {
        
        let parameters: Parameters = [
            "user_id": self.id!
        ]
        
        Alamofire.request(GET_LIST_OF_VEHICLES_URL, method: .post, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
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
    //TODO: add_vehicle_request
}
