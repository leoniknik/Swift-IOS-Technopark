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
        let email = emailTextField.text
        let password = passwordTextField.text
        //let repeatPassword = repeatPasswordTextField.text
        let firstname = firstnameTextField.text
        let lastname = lastnameTextField.text
        let phone = phoneTextField.text
         createSignUpRequest(email: email!, password: password!, firstname: firstname!, lastname: lastname!, phone: phone!)
    }
    
    func createSignUpRequest(email: String, password: String, firstname: String, lastname: String, phone: String) -> Void {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
