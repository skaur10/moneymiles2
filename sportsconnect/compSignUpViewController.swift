//
//  compSignUpViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 3/25/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class compSignUpViewController: UIViewController {

    var refCompetition1:DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()

        // set the firebase reference
        refCompetition1 = Database.database().reference().child("competition1");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let userID = Auth.auth().currentUser!.uid
        //let username = Auth.auth().currentUser!.uid
    
        let key = refCompetition1?.childByAutoId().key
        //building child
        let competition = ["id":key,"name": "bhavesh shah","userid":userID,"score": "0"]
        
        //pushes child to parent
        refCompetition1?.child(key!).setValue(competition)
    }
    
}
