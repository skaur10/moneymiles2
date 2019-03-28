//
//  homeViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/16/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit
import CoreLocation
import FirebaseAuth
import FirebaseDatabase

class homeViewController: UIViewController,  CLLocationManagerDelegate {

    var refActivities:DatabaseReference?
    var username:String?
    var activityData = [activitiesModel]()
    let locationManager = CLLocationManager()
    var traveledDistance: Double = 0
    @IBOutlet weak var levelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if traveledDistance<=500 {
            levelLabel.text="Beginner"
        }
        else {
            levelLabel.text="Advanced"
        }
        
        // set the firebase reference
        refActivities = Database.database().reference().child("activities");

        // retrieve the posts and listen for changes
        refActivities?.observe(DataEventType.value, with: { (snapshot) in
            
            for activities in snapshot.children.allObjects as! [DataSnapshot] {
                let actObject = activities.value as? [String: AnyObject]
                let actName = actObject?["activityName"] as! String?
                let actnumPlayers = actObject?["numPlayers"] as! String?
                let actDescription = actObject?["description"] as! String?
                let actId = actObject?["id"] as! String?
                
                
                let activity = activitiesModel(id: actId ,activityName: actName ,numPlayers: actnumPlayers ,description: actDescription)
                
                self.activityData.append(activity)
            }
            
        })
        
        // Can use both when app is open and when app is in background.
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    // authorization code for location
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    
    // Disabled PopUp code
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled", message: "In order to get events near you , we need your location.", preferredStyle: . alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  // lol what is this code
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activitySegue" {
            let destinationVC = segue.destination as! conditionsViewController
            //let cell = sender as! homeTableViewCell
           // destinationVC.activityName = cell.activityname.text
        }
    }
    
    
    @IBAction func onAddWorkout(_ sender: Any) {
        self.performSegue(withIdentifier: "workoutSegue", sender: nil)
    }
    
    
}
