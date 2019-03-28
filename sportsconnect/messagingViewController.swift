//
//  messagingViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/16/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//messageSegue

import UIKit
import FirebaseAuth
import FirebaseDatabase

class messagingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageField: UITextField!
    
    var username:String?
    
    var refMessages:DatabaseReference?
    
    var messageData = [messagesModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 100
        
        // set the firebase reference
        refMessages = Database.database().reference().child("messages");
        
        // retrieve the posts and listen for changes
        refMessages?.observe(DataEventType.value, with: { (snapshot) in
            
            for messages in snapshot.children.allObjects as! [DataSnapshot] {
                let messageObject = messages.value as? [String: AnyObject]
                let messageText = messageObject?["textt"] as! String?
                let messageName = messageObject?["name"] as! String?
                let messageId = messageObject?["id"] as! String?
                
                let message = messagesModel(id: messageId,name:messageName,textt: messageText)
                
                self.messageData.append(message)
            }
            
            self.tableView.reloadData()
            
            self.updateUI()
        })
        
    }

    func updateUI() {
        self.tableView.rowHeight = 125
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! messageTableViewCell
        
        let message: messagesModel
        message = messageData[indexPath.row]
        cell.nameLabel.text = message.name
        cell.messageLabel.text = message.textt
        
        
        return cell
    }
    
    @IBAction func onPost(_ sender: Any) {
        // key for child
        let key = refMessages?.childByAutoId().key
        
        //building child
        let message = ["id":key,"name": "bhavesh shah","textt": messageField.text as! String]
        
        //pushes child to parent
        refMessages?.child(key!).setValue(message)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
