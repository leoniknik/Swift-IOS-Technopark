//
//  ListOfVehiclesViewController.swift
//  RAT
//
//  Created by Kirill on 3/30/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import UIKit

class ListOfVehiclesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listOfVehiclesTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfVehiclesTable.dataSource = self
        listOfVehiclesTable.delegate = self
        // listOfCrashesTable.separatorStyle = .none // delete all separators
        listOfVehiclesTable.tableFooterView = UIView() // delete excess separators
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listOfVehiclesTable.dequeueReusableCell(withIdentifier: "VehicleCell") as! VehicleCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "fromListOfVehicleToListOfCrashesSegue", sender: nil) // transition
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromListOfVehicleToListOfCrashesSegue" {
            
        }
    }
}
