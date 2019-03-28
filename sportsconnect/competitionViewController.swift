//
//  competitionViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 3/25/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit

class competitionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        performSegue(withIdentifier: "signUpCompSegue", sender: nil)
    }
    

}
