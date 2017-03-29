//
//  RegistrationViewController.swift
//  RAT
//
//  Created by Kirill on 3/17/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBAction func signUp(_ sender: Any) {
        // TODO: проверить вводимые поля
        Person.instance.email = emailTextField.text!
        Person.instance.password = passwordTextField.text!
        Person.instance.firstname = firstnameTextField.text!
        Person.instance.lastname = lastnameTextField.text!
        Person.instance.phone = phoneTextField.text!
        Person.instance.createSignUpRequest()
        // TODO: проверить зарегались мы или нет, если да то сделать переход на listofVehicles
        self.performSegue(withIdentifier: "fromRegistrationToListOfVehiclesSegue", sender: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
