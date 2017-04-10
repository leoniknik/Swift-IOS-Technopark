//
//  Vehicle.swift
//  RAT
//
//  Created by Kirill on 3/29/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import Foundation
import RealmSwift

class Vehicle: Object{
    
    dynamic var id: Int = 0
    dynamic var VIN: String = ""
    dynamic var number: String = ""
    dynamic var brand: String = ""
    dynamic var model: String = ""
    dynamic var year: String = ""
    dynamic var owner: Person?
    var historyCrashes = LinkingObjects(fromType: Crash.self, property: "vehicle")
    var actualCrashes = LinkingObjects(fromType: Crash.self, property: "vehicle")
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
