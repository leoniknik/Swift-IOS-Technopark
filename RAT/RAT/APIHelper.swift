//
//  APIHelper.swift
//  RAT
//
//  Created by Kirill on 4/2/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIHelper {
    
    
    static let SERVER_IP="http://192.168.1.33:8000"
    
    static let SIGNUP_URL = "\(SERVER_IP)"+"/api/signup"
    static let LOGIN_URL = "\(SERVER_IP)"+"/api/signin"
    static let GET_LIST_OF_VEHICLES_URL = "\(SERVER_IP)"+"/api/get_list_of_vehicles"
    static let EDIT_USER_URL = "\(SERVER_IP)"+"/api/edit_user"
    static let ADD_VEHICLE_URL = "\(SERVER_IP)"+"/api/signin"
    static let EDIT_VEHICLE_URL = "\(SERVER_IP)"+"/api/edit_vehicle"
    static let GET_LIST_OF_HISTORY_CRASHES_URL = "\(SERVER_IP)"+"/api/get_list_of_history_crashes"
    static let GET_LIST_OF_ACTUAL_CRASHES_URL = "\(SERVER_IP)"+"/api/get_list_of_actual_crashes"
    static let GET_LIST_OF_OFFERS = "\(SERVER_IP))"+"/api/get_list_of_offers"
    
    
    class func signUpRequest() -> Void {
        
         let parameters: Parameters = [
            "email": Person.instance.email,
            "password": Person.instance.password,
            "firstname": Person.instance.firstname,
            "lastname": Person.instance.lastname,
            "phone": Person.instance.phone
         ]
        
        request(URL: SIGNUP_URL, method: .post, parameters: parameters, onSuccess: defaultOnSuccess, onError: defaultOnError)
        
    }
    
    class func logInRequest() -> Void {

        let parameters: Parameters = [
            "email": Person.instance.email,
            "password": Person.instance.password
        ]
        
        request(URL: LOGIN_URL, method: .post, parameters: parameters, onSuccess: logInOnSuccess, onError: defaultOnError)

    }
    
    class func logInOnSuccess(json: JSON) -> Void {
        
        Person.instance.firstname = json["firstname"].string!
        Person.instance.lastname = json["lastname"].string!
        Person.instance.phone = json["phone"].string!
        Person.instance.id = json["user_id"].int
        
    }
    
    class func getListOfVehiclesRequest() -> Void {
        
        let parameters: Parameters = [
            "user_id": Person.instance.id!
        ]
        
        request(URL: GET_LIST_OF_VEHICLES_URL, method: .get, parameters: parameters, onSuccess: getListOfVehiclesOnSuccess, onError: defaultOnError)
    }
    
    class func getListOfVehiclesOnSuccess(json: JSON) -> Void{

    let json = JSON(json)["data"].array!
    for vehicle in json {
        Person.instance.arrayVehicles.removeAll()
        Person.instance.arrayVehicles.append(Vehicle(vehicle: vehicle))
        }
        
    }

    class func editUserRequest() -> Void {
        
        let parameters: Parameters = [
            "user_id": Person.instance.id!,
            "email": Person.instance.email,
            "password": Person.instance.password,
            "firstname": Person.instance.firstname,
            "lastname": Person.instance.lastname,
            "phone": Person.instance.phone
        ]
        
        request(URL: EDIT_USER_URL, method: .post, parameters: parameters, onSuccess: defaultOnSuccess, onError: defaultOnError)
    }

    class func addVehiclesRequest(vehicle: Vehicle) -> Void {
        
        let parameters: Parameters = [
            "user_id": vehicle.id!,
            "VIN": vehicle.VIN,
            "number": vehicle.number,
            "brand": vehicle.brand,
            "model": vehicle.model,
            "year": vehicle.year
        ]
        
        request(URL: ADD_VEHICLE_URL, method: .post, parameters: parameters, onSuccess: defaultOnSuccess, onError: defaultOnError)

    }

       class func getListOfHistoryCrashesRequest(vehicle: Vehicle) -> Void {
        
        let parameters: Parameters = [
            "vehicle_id": vehicle.id!
        ]
        
        request(URL: GET_LIST_OF_HISTORY_CRASHES_URL, method: .get, parameters: parameters, onSuccess: defaultOnSuccess, onError: defaultOnError)
    }

    class func getListOfActualCrashesRequest(vehicle: Vehicle) -> Void {
        
        let parameters: Parameters = [
            "vehicle_id": vehicle.id!
        ]
        
        request(URL: GET_LIST_OF_ACTUAL_CRASHES_URL, method: .get, parameters: parameters, onSuccess: defaultOnSuccess, onError: defaultOnError)
        
    }
    
    class func editVehicleRequest(vehicle: Vehicle) -> Void {
        
        let parameters: Parameters = [
            "user_id": vehicle.id!,
            "VIN": vehicle.VIN,
            "number": vehicle.number,
            "brand": vehicle.brand,
            "model": vehicle.model,
            "year": vehicle.year
        ]
        
        request(URL: EDIT_VEHICLE_URL, method: .post, parameters: parameters, onSuccess: defaultOnSuccess, onError: defaultOnError)
    }

    class func getListOfOffersRequest(crash: Crash) -> Void {
        
        let parameters: Parameters = [
            "crash_id": crash.id!
        ]
        
        request(URL: GET_LIST_OF_OFFERS, method: .get, parameters: parameters, onSuccess: defaultOnSuccess, onError: defaultOnError)
    }
    
    
    class func defaultOnSuccess(json: JSON) -> Void{
        print(json)
    }
    
    class func defaultOnError(error: Any) -> Void {
        print(error)
    }
    
    class func request(URL: String, method: HTTPMethod, parameters: Parameters, onSuccess: @escaping (JSON) -> Void , onError: @escaping (Any) -> Void) -> Void {
        Alamofire.request(URL, method: method, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                onSuccess(json)
            case .failure(let error):
                onError(error)
            }
        }
    }

}
