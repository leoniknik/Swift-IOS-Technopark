//
//  ViewController.swift
//  RAT
//
//  Created by Kirill on 3/16/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageLabelView: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var registrationLabel: UILabel!
    
    @IBOutlet weak var registrationButton: UIButton!
    
    @IBOutlet weak var vkLogInButton: UIButton!
    
    @IBOutlet weak var facebookLogInButton: UIButton!
    
    var person = Person()
    
    @IBAction func logIn(_ sender: Any) {
        // TODO: проверить вводимые поля
        /*
        person.email = emailTextField.text!
        person.password = passwordTextField.text!
         */
        
        person.email = "leoniknik@mail.ru"
        person.password = "1234"
        
        APIHelper.logInRequest(person: person)
        
    }
    
    @IBAction func vkLogIn(_ sender: Any) {
        
    }
    @IBAction func facebookLogIn(_ sender: Any) {
        
    }
    
    func logInCallback(_ notification: NSNotification){
        
        let data = notification.userInfo as! [String : Any]
        let id = data["user_id"]
        person = DataBaseHelper.getPerson(email: person.email)
        DataBaseHelper.setPersonID(person: person, id: id as! Int)
        print(person.id)
        performSegue(withIdentifier: "fromAuthorizationToListOfVehiclesSegue", sender: person)
    }
    
    func getVehiclesCallback(_ notification: NSNotification){
        
        let data = notification.userInfo as! [String : Any]
        let vehicles = data["data"]
        print(vehicles!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(logInCallback(_:)), name: .logInCallback, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(getVehiclesCallback(_:)), name: .getVehiclesCallback, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromAuthorizationToListOfVehiclesSegue"{
            APIHelper.getListOfVehiclesRequest(person: person)
        }
    }

}

