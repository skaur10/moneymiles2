//
//  eventsViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/16/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class eventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    
    var eventName:String?
    var miles:String?
    var partnerLevel:String?
    var date:String?
    var username:String?
    
    var refEvents:DatabaseReference?

    var eventData = [eventsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 100
        //print(eventName!)
        print(miles!)
        print(partnerLevel!)
        print(date!)
        
        // set the firebase reference
        refEvents = Database.database().reference().child("events");
        
        // retrieve the posts and listen for changes
        refEvents?.observe(DataEventType.value, with: { (snapshot) in
            
            for events in snapshot.children.allObjects as! [DataSnapshot] {
                let eventObject = events.value as? [String: AnyObject]
                let eventTown = eventObject?["town"] as! String?
                let eventDate = eventObject?["date"] as! String?
                let eventLevel = eventObject?["level"] as! String?
                let eventId = eventObject?["id"] as! String?
                
                let event = eventsModel(id: eventId,date: eventDate,town: eventTown ,level: eventLevel!)
                
                self.eventData.append(event)
            }
            
            self.tableView.reloadData()

            self.updateUI()
       })
    }
    
    func updateUI() {
        self.tableView.rowHeight = 125
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! eventsTableViewCell
        
        let event: eventsModel
        event = eventData[indexPath.row]
        cell.eventNameLabel.text = "John Smith" // Get this value from Anthony
        //cell.eventDateLabel.text = event.date
        //cell.eventTownLabel.text=event.town
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "messageSegue" {
            let destinationVC = segue.destination as! messagingViewController

        }
    }
}

