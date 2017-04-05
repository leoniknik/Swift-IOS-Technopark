//
//  DataBaseHelper.swift
//  RAT
//
//  Created by Kirill on 4/4/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import Foundation
import RealmSwift

class DataBaseHelper {
    
    static let realm = try! Realm()
    
    class func getPerson(email: String) -> Person{
        let predicate = NSPredicate(format: "email = \(email)")
        return realm.objects(Person.self).filter(predicate).first!
    }
    
    class func setPersonID(person: Person, id: Int){
        try! realm.write {
            person.id = id
        }
    }
    
    class func setPerson(person: Person, id: Int, email: String, password: String, firstname: String, lastname: String, phone: String){
        try! realm.write {
            person.id = id
            person.email = email
            person.password = password
            person.firstname = firstname
            person.lastname = lastname
            person.phone = phone
        }
    }
    
    class func save(object: Object){
        try! realm.write {
            realm.add(object)
        }
    }
}
