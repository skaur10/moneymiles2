//
//  homeTableViewCell.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/16/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit

class homeTableViewCell: UITableViewCell {

    @IBOutlet weak var workoutNumber: UILabel!
    @IBOutlet weak var workoutName: UILabel!
        
    @IBOutlet weak var activityname: UILabel!
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      //  updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    //func updateUI() {
        //cellView.layer.cornerRadius = 10
    //}
    
  //  func updateImages(name:String) {
    //    activityImageView.image = UIImage(named: name+".png")
   // }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 4
            frame.size.height -= 2 * 5
            super.frame = frame
        }
    }
    
    
}
