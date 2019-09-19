//
//  ViewController.swift
//  TwitterMessagingApp
//
//  Created by Kevin Maloles on 19/09/2019.
//  Copyright © 2019 Kevin Maloles. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let twitterManager = TwitterManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onAuthenticateTapped(_ sender: Any) {
        twitterManager.login { success in
            if success {
                self.present(FollowersListingViewController.storyboardInstance(), animated: true, completion: nil)
            }else{
                debugPrint("login failed")
            }
        }
        
    }
    
    
    @IBAction func onRetrieveTapped(_ sender: Any) {
        twitterManager.getFollowers(){
            guard $0.count > 0 else {
                return
            }
            self.present(FollowersListingViewController.storyboardInstance(), animated: true, completion: nil)
        }
    }

}

