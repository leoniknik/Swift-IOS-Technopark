//
//  ListOfVehiclesViewController.swift
//  RAT
//
//  Created by Kirill on 3/30/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import UIKit
import SwiftyJSON

class ListOfVehiclesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listOfVehiclesTable: UITableView!
    var person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfVehiclesTable.dataSource = self
        listOfVehiclesTable.delegate = self
        // listOfCrashesTable.separatorStyle = .none // delete all separators
        listOfVehiclesTable.tableFooterView = UIView() // delete excess separators
        NotificationCenter.default.addObserver(self, selector: #selector(getVehiclesCallback(_:)), name: .getVehiclesCallback, object: nil)
        person = DataBaseHelper.getPerson()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listOfVehiclesTable.dequeueReusableCell(withIdentifier: "VehicleCell") as! VehicleCell
        let index = indexPath.item
        cell.number.text = person.vehicles[index].number
        cell.brand.text = person.vehicles[index].brand
        cell.model.text = person.vehicles[index].model
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "fromListOfVehicleToListOfCrashesSegue", sender: nil) // transition
    }
 
    func getVehiclesCallback(_ notification: NSNotification){
        let person = DataBaseHelper.getPerson()
        let data = notification.userInfo as! [String : JSON]
        let vehicles = data["data"]!.arrayValue
        for vehicle in vehicles {
            DataBaseHelper.setVehicle(person: person, json: vehicle)
        }
        self.listOfVehiclesTable.reloadData()
    }
}
