//
//  Person.swift
//  RAT
//
//  Created by Kirill on 3/28/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import Foundation

final class Person {
    
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
    
}
