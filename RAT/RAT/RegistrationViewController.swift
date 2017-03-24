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
        createRequest()
    }
    
    func createRequest() -> Void {
        // создаем сессию
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        // Выходим если не удалось инициировать УРЛ из строки
        guard let URL = NSURL(string: "https://.../api/signup") else {return}
        let request = NSMutableURLRequest(url: URL as URL)
        // Формируем запрос для метода POST
        request.httpMethod = "POST"
        //  Устанавливаем заголовки запроса
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // Само тело запроса
        let bodyObject = [
            "email":  "\(emailTextField.text)",
            "password": "\(passwordTextField.text)",
            "firstname": "\(firstnameTextField.text)",
            "lastname": "\(lastnameTextField.text)",
            "phone": "\(phoneTextField.text)"
        ]
        // Устанавливаем тело в запросе
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                
            } else {
                // Обработка ошибки коннекта
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
