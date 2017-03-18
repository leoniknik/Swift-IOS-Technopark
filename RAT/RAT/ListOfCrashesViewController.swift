//
//  ListOfCrashesViewController.swift
//  RAT
//
//  Created by Kirill on 3/18/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import UIKit

class ListOfCrashesViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var listOfCrashesTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        listOfCrashesTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listOfCrashesTable.dequeueReusableCell(withIdentifier: "CrashCell")
        return cell!
    }
}
