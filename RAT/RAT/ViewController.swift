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
    
    let person = Person()
    
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
    
    /*
    @IBAction func goToListOfVehicles(_ sender: Any){
        performSegue(withIdentifier: "fromRegistrationToListOfVehiclesSegue", sender: nil)
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromAuthorizationToListOfVehiclesSegue"{
            Person.instance.getListOfVehiclesRequest()
        }
    }
*/
}

