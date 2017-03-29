//
//  Vehicle.swift
//  RAT
//
//  Created by Kirill on 3/29/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Vehicle {
    
    var id: Int?
    var VIN: String = ""
    var number: String = ""
    var brand: String = ""
    var model: String = ""
    var year: Date?
    
    let EDIT_VEHICLE_URL = "http://192.168.1.51:8000/api/edit_vehicle"
    let GET_LIST_OF_HISTORY_CRASHES_URL = "http://192.168.1.51:8000/api/get_list_of_history_crashes"
    let GET_LIST_OF_ACTUAL_CRASHES_URL = "http://192.168.1.51:8000/api/get_list_of_actual_crashes"
    
    func getListOfHistoryCrashesRequest() -> Void {
        
        let parameters: Parameters = [
            "vehicle_id": id!
        ]
        
        Alamofire.request(GET_LIST_OF_HISTORY_CRASHES_URL, method: .post, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getListOfActualCrashesRequest() -> Void {
        
        let parameters: Parameters = [
            "vehicle_id": id!
        ]
        
        Alamofire.request(GET_LIST_OF_ACTUAL_CRASHES_URL, method: .post, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func editVehicleRequest() -> Void {
        
        let parameters: Parameters = [
            "vehicle_id": self.id!,
            "VIN": self.VIN,
            "number": self.number,
            "brand": self.brand,
            "model": self.model,
            "year": self.year!,
        ]
        
        Alamofire.request(EDIT_VEHICLE_URL, method: .post, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
