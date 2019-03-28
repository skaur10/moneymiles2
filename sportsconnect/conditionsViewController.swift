//
//  conditionsViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/16/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit

class conditionsViewController: UIViewController {

    
    @IBOutlet weak var milesSelector: UISegmentedControl!
    @IBOutlet weak var partnerSelector: UISegmentedControl!
    @IBOutlet weak var dateSelector: UIDatePicker!
    
    var activityName : String?
    var username:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eventSegue" {
            let destinationVC = segue.destination as! eventsViewController
            destinationVC.miles = getMiles(sender: milesSelector)
            destinationVC.partnerLevel = getPartnerLevel(sender: partnerSelector)
            destinationVC.date = getDate(sender: dateSelector)
            //destinationVC.eventName = activityName!
        }
    }
    
    func getMiles(sender : UISegmentedControl) -> String {
        switch sender.selectedSegmentIndex {
        case 0:
            return "0-1"
        case 1:
            return "1-6"
        case 2:
            return "5-10"
        case 3:
           return "10+"
        default:
            return " "
        }
    }
    
    func getPartnerLevel(sender : UISegmentedControl) -> String {
        switch sender.selectedSegmentIndex {
        case 0:
            return "Beginner"
        case 1:
            return "Intermidiate"
        case 2:
            return "Advance"
        default:
            return " "
        }
    }
    
    func getDate(sender : UIDatePicker) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: sender.date)
    }
}
