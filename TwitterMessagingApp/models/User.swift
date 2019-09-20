//
//  User.swift
//  TwitterMessagingApp
//
//  Created by Kevin Maloles on 19/09/2019.
//  Copyright © 2019 Kevin Maloles. All rights reserved.
//

import Foundation

struct UserResponse: Codable {
    var users: [User]?
}

struct User: Codable {
    var name: String?
    var idStr: String?
    var profileImageUrlHttps: String?
    var screenName: String?
}

