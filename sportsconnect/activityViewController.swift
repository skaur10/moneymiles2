//
//  activityViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/16/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit
import FirebaseDatabase

class activityViewController: UIViewController {

    var refActivities:DatabaseReference?
    
    @IBOutlet weak var loseWeight: UIView!
    
    @IBOutlet weak var buildMuscle: UIView!
    @IBOutlet weak var buildEndurance: UIView!
    @IBOutlet weak var improveFlexibility: UIView!
    @IBOutlet weak var getStronger: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loseWeight.layer.cornerRadius = 10;
        loseWeight.layer.masksToBounds = true;
        buildMuscle.layer.cornerRadius = 10;
        buildMuscle.layer.masksToBounds = true;
        buildEndurance.layer.cornerRadius = 10;
        buildEndurance.layer.masksToBounds = true;
        improveFlexibility.layer.cornerRadius = 10;
        improveFlexibility.layer.masksToBounds = true;
        getStronger.layer.cornerRadius = 10;
        getStronger.layer.masksToBounds = true;
       
        
        
        
        
        
        //top of the tree, activity is the name of the table
        refActivities = Database.database().reference().child("activities");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onUpdate(_ sender: Any) {
        // key for child
        let key = refActivities?.childByAutoId().key
        
        //building child
       // let activity = ["id":key,"activityName": activityLabel.text! as String,"numPlayers": playersLabel.text! as String,"description": descriptionLabel.text! as String]
        
        //pushes child to parent
       // refActivities?.child(key!).setValue(activity)
        
    }
    
    @IBAction func onLoseWeight(_ sender: Any) {
        self.performSegue(withIdentifier: "conditionsSegue", sender: nil)
    }
    
    @IBAction func onBuildMuscle(_ sender: Any) {
        self.performSegue(withIdentifier: "conditionsSegue", sender: nil)
    }
    
    @IBAction func onBuildEndurance(_ sender: Any) {
        self.performSegue(withIdentifier: "conditionsSegue", sender: nil)
    }
    
    @IBAction func onImproveFlexibility(_ sender: Any) {
        self.performSegue(withIdentifier: "conditionsSegue", sender: nil)
    }
    
    @IBAction func onGetStronger(_ sender: Any) {
        self.performSegue(withIdentifier: "conditionsSegue", sender: nil)
    }
    
}
