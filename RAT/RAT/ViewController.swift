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
    
    @IBAction func logIn(_ sender: Any) {
        // TODO: проверить вводимые поля
        Person.instance.email = emailTextField.text!
        Person.instance.password = passwordTextField.text!
        Person.instance.logInRequest()
        // если зарегались
        self.performSegue(withIdentifier: "fromAuthorizationToListOfVehiclesSegue", sender: nil)
    }
    
    @IBAction func vkLogIn(_ sender: Any) {
        
    }
    @IBAction func facebookLogIn(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromAuthorizationToListOfVehiclesSegue"{
            Person.instance.getListOfVehiclesRequest()
        }
    }
}

