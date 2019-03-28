//
//  weekViewController.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 3/12/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit

class weekViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onMessage(_ sender: Any) {
        self.performSegue(withIdentifier: "messageSegue", sender: nil)
    }
    
    @IBAction func onCheckOne(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false // when checked, turn into uncheck
        }
        else {
            sender.isSelected = true // when unchecked, turn into check
        }
    }
    
    @IBAction func onCheckTwo(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false // when checked, turn into uncheck
        }
        else {
            sender.isSelected = true // when unchecked, turn into check
        }
    }
    
    @IBAction func onCheckThree(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false // when checked, turn into uncheck
        }
        else {
            sender.isSelected = true // when unchecked, turn into check
        }
    }
    
    
}
