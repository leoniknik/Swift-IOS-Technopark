//
//  ServiceViewController.swift
//  RAT
//
//  Created by Kirill on 4/13/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import UIKit
import SwiftyJSON

class ServiceViewController: UIViewController {
    
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceDescription: UITextView!
    @IBOutlet weak var listOfReviewsTable: UITableView!
    
    var service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getServiceCallback(_ notification: NSNotification){
        let data = notification.userInfo as! [String : JSON]
        let service = data["data"]!
        DataBaseHelper.setService(json: service)
    }
    
    func getListOfReviewsCallback(_ notification: NSNotification){
        let data = notification.userInfo as! [String : JSON]
        let reviews = data["data"]!.arrayValue
        for review in reviews {
            DataBaseHelper.setReview(service: service, json: review)
        }
        self.listOfReviewsTable.reloadData()
        
    }
}
