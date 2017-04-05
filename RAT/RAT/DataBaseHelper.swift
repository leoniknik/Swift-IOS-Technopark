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
    
    
    class func getPerson() -> Person{
        let predicate = NSPredicate(format: "actual == true")
        return realm.objects(Person.self).filter(predicate).first!
    }
    
    
    class func clearActualPerson(){
        let persons = realm.objects(Person.self)
        for person in persons {
            try! realm.write {
                person.actual = false
            }
        }
    }
    
    class func setPerson(person: Person, id: Int, email: String, firstname: String, lastname: String, phone: String, actual: Bool){
            person.id = id
            person.email = email
            person.firstname = firstname
            person.lastname = lastname
            person.phone = phone
            person.actual = actual
            save(object: person)
    }
    
    
    class func save(object: Object){
        try! realm.write {
            realm.add(object, update: true)
        }
    }
}
