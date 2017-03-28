//
//  RegistrationViewController.swift
//  RAT
//
//  Created by Kirill on 3/17/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var person: Person?
    
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
        
        let SIGNUP_URL = "http://192.168.1.51:8000/api/signup"
/*
        let parameters: Parameters = [
            "email": email,
            "password": password,
            "firstname": firstname,
            "lastname": lastname,
            "phone": phone
        ]
*/
        let parameters: Parameters = [
            "email": "aaaa@mail.ru",
            "password": "kial",
            "firstname": "aaa",
            "lastname": "bbbb",
            "phone": "123"
        ]
        
        Alamofire.request(SIGNUP_URL, method: .post, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
