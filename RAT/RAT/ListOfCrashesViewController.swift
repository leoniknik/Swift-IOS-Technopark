//
//  ListOfCrashesViewController.swift
//  RAT
//
//  Created by Kirill on 3/18/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import UIKit

class ListOfCrashesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var listOfCrashesTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        listOfCrashesTable.dataSource = self
        listOfCrashesTable.delegate = self
        // listOfCrashesTable.separatorStyle = .none // delete all separators
        listOfCrashesTable.tableFooterView = UIView() // delete excess separators
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listOfCrashesTable.dequeueReusableCell(withIdentifier: "CrashCell") as! CrashCell
        //cell.errorCode.text = "1234"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "fromListOfCrashesToCrashSeage", sender: nil) // transition
    }
    
    //data send
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // destination
        let controller = segue.destination
        controller.title = sender as? String
    }
}
