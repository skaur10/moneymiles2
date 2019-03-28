//
//  adminViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 3/25/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit
import FirebaseDatabase

class adminViewController: UIViewController {

    var refActivities:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refActivities = Database.database().reference().child("competitions");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
