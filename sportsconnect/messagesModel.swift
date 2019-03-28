//
//  messagesModel.swift
//  sportsconnect
//
//  Created by Bhavesh Shah on 2/17/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

class messagesModel {
    var id: String?
    var name: String?
    var textt: String?
    
    init(id: String?,name: String?,textt: String?) {
        self.id = id;
        self.name = name;
        self.textt=textt;
    }
}
