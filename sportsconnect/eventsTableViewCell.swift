//
//  eventsTableViewCell.swift
//  sportsconnect
//
//  Created by Anthony Bravo on 2/16/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit

class eventsTableViewCell: UITableViewCell {

    //Fields of Event cells
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var joinButtton: UIButton!
    @IBOutlet weak var leaveButton: UIButton!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventTownLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func updateUI() {
        leaveButton.isHidden = true
        joinButtton.layer.cornerRadius = 10
        leaveButton.layer.cornerRadius = 10
    }
    
    @IBAction func joinButtonClicked(_ sender: Any) {
        joinButtton.isHidden = true
        leaveButton.isHidden = false
    }
    
    @IBAction func leaveButtonClicked(_ sender: Any) {
        joinButtton.isHidden = false
        leaveButton.isHidden = true
    }
    

}
