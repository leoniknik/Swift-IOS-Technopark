//
//  Person.swift
//  RAT
//
//  Created by Kirill on 3/28/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import Foundation

class Person {
    
    var email : String = ""
    var password : String = ""
    var firstname : String = ""
    var lastname : String = ""
    var phone : String = ""
    
    init(email: String, password: String, firstname: String, lastname: String, phone: String) {
        
        self.email = email
        self.password = password
        self.firstname = firstname
        self.lastname = lastname
        self.phone = phone

    }
}
