//
//  DataBaseHelper.swift
//  RAT
//
//  Created by Kirill on 4/4/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class DataBaseHelper {
    
    static let realm = try! Realm()
    
    class func setVehicle(person: Person, json: JSON){
        let vehicle = Vehicle()
        vehicle.number = json["number"].stringValue
        vehicle.brand = json["brand"].stringValue
        vehicle.VIN = json["VIN"].stringValue
        vehicle.year = json["year"].stringValue
        vehicle.model = json["model"].stringValue
        vehicle.id = json["id"].intValue
        vehicle.owner = person
        save(object: vehicle)
    }
    
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
