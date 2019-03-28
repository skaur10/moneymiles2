//
//  organizeEventsViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/17/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit
import FirebaseDatabase

class organizeEventsViewController: UIViewController {

    var refEvents:DatabaseReference?

    @IBOutlet weak var dateTime: UIDatePicker!
    @IBOutlet weak var levelSegControl: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        refEvents = Database.database().reference().child("events");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onUpdate(_ sender: Any) {
        var level = "level";
        if levelSegControl.selectedSegmentIndex==0 {
            level="beginner";
        }
        if levelSegControl.selectedSegmentIndex==1 {
            level="intermediate";
        }
       else if levelSegControl.selectedSegmentIndex==2 {
            level="advanced";
        }
        
        
        // key for child
        let key = refEvents?.childByAutoId().key
        
        //building child
        let event = ["id":key,"date": "02/18/19","town": "Bayside","level": level as String]
        
        //pushes child to parent
        refEvents?.child(key!).setValue(event)
    }
    
}
