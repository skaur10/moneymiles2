//
//  signupViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/16/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class signupViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{

    @IBOutlet weak var myImageView: UIImageView!

    
    @IBAction func importImage(_ sender: Any) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: false)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImageView.image = image
        }
        else{
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var genderSegControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
            myImageView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
            myImageView.layer.cornerRadius = 5.0
            myImageView.layer.borderWidth = 2
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onRegister(_ sender: Any) {
        if let email = usernameField.text, let pass = passwordField.text {
            Auth.auth().createUser(withEmail: email, password: pass, completion: { (user,error) in
            
            // Chat that user isn't nil
                if let u = user {
                    self.performSegue(withIdentifier: "registerSegue", sender: nil)
                }
                else {
                    // return error message if doesnt work
                }
            })
       
        }
    
    }
}
