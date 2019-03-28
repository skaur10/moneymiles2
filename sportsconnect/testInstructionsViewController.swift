//
//  testInstructionsViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 3/23/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit

class testInstructionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onStart(_ sender: Any) {
        performSegue(withIdentifier: "testSegue", sender: nil)
    }
}
