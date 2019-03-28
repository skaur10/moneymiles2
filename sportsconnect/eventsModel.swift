//
//  eventsModel.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/17/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

class eventsModel {
    var id: String?
    var date: String?
    var town: String?
    var level: String?
    
    init(id: String?,date: String?,town: String?,level: String) {
        self.id = id;
        self.date=date;
        self.town=town;
        self.level=level;
    }
}
