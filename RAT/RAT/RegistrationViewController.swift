//
//  RegistrationViewController.swift
//  RAT
//
//  Created by Kirill on 3/17/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import UIKit
import RealmSwift

class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBAction func signUp(_ sender: Any) {
        let person = Person()
        /*
        person.email = emailTextField.text!
        person.password = passwordTextField.text!
        person.firstname = firstnameTextField.text!
        person.lastname = lastnameTextField.text!
        person.phone = phoneTextField.text!
        */
        
        
        person.email = "user@mail.ru"
        person.password = "qwerty"
        person.firstname = "user"
        person.lastname = "userovich"
        person.phone = "88005553535"
        
        APIHelper.signUpRequest(person: person)
        DataBaseHelper.save(object: person)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
