//
//  ViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/15/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(_ sender: Any) {
        if let email = usernameField.text, let pass = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: pass, completion: { (user,error) in
                
                // Chat that user isn't nil
                if let u = user {
                    if self.usernameField.text == "admin" && self.passwordField.text == "admin" {
                        self.performSegue(withIdentifier: "adminSegue", sender: nil)
                    }
                    else {
                        self.performSegue(withIdentifier: "mainSegue", sender: nil)
                    }
                }
                else {
                    // return error message if doesnt work
                }
            })
            
        }
        
    }
    
    func getUserName() -> String {
        var email:String = usernameField.text!
        var userName:String = ""
        for char in email {
            if char == "@" {
                break
            }
            userName.append(char)
        }
        print(userName)
        return userName
    }
    
    @IBAction func onRegister(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
    @IBAction func onTest(_ sender: Any) {
        performSegue(withIdentifier: "testSegue2", sender: nil)
    }

}

