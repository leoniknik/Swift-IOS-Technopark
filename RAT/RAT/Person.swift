//
//  Person.swift
//  RAT
//
//  Created by Kirill on 3/28/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    
    dynamic var id = 0
    dynamic var email : String = ""
    dynamic var password : String = ""
    dynamic var firstname : String = ""
    dynamic var lastname : String = ""
    dynamic var phone : String = ""
    let vehicles = List<Vehicle>()
    
}
