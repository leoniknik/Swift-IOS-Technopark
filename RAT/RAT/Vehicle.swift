//
//  Vehicle.swift
//  RAT
//
//  Created by Kirill on 3/29/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import Foundation
import SwiftyJSON

class Vehicle {
    
    
    var id: Int?
    var VIN: String = ""
    var number: String = ""
    var brand: String = ""
    var model: String = ""
    var year: String = ""
    
    /*
    init(id:Int,VIN:String,number:String,brand:String,model:String,year:String) {
        
        self.id = id
        self.VIN = VIN
        self.number = number
        self.brand = brand
        self.model = model
        self.year = year
    
    }
 */
    
    init(vehicle:JSON) {
        self.id = vehicle["id"].int
        self.VIN = vehicle["VIN"].string!
        self.number = vehicle["number"].string!
        self.brand = vehicle["brand"].string!
        self.model = vehicle["model"].string!
        self.year = vehicle["year"].string!
        
    }
    
    var arrayHistoryCrashes = Array<Crash>()
    
    var arrayActualCrashes = Array<Crash>()
    
}
