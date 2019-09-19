//
//  FollowersListingViewController.swift
//  TwitterMessagingApp
//
//  Created by Kevin Maloles on 19/09/2019.
//  Copyright © 2019 Kevin Maloles. All rights reserved.
//

import Foundation
import UIKit
import TwitterKit

class FollowersListingViewController: UIViewController {
    
    override func viewDidLoad() {
        if let userID = TWTRTwitter.sharedInstance().sessionStore.session()?.userID {
            let client = TWTRAPIClient(userID: userID)
            // make requests with client
        }
    }
}
