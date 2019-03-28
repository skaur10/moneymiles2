//
//  activitiesModel.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/16/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

class activitiesModel {
    var id: String?
    var activityName: String?
    var numPlayers: String?
    var description: String?
    
    init(id: String?,activityName: String?,numPlayers: String?,description: String?) {
        self.id = id;
        self.activityName=activityName;
        self.numPlayers=numPlayers;
        self.description=description;
    }
}
