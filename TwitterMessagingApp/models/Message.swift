//
//  Message.swift
//  TwitterMessagingApp
//
//  Created by Kevin Maloles on 9/20/19.
//  Copyright © 2019 Kevin Maloles. All rights reserved.
//

import Foundation

struct Message {
    var sender: User
    var recipient: User
    var dateSent: Date
    var dateReceived: Date?
    var body: String
}
