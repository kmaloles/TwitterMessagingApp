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
    
    @IBOutlet weak var tableView: UITableView!
    var users: [User] = []{
        didSet {
            tableView.reloadData()
        }
    }
    var twitterManager = TwitterManager.shared
    var selectedUser: User?
    
    override func viewDidLoad() {
        initTableView()
        twitterManager.getFollowers {
            self.users = $0
        }
    }
    
    func initTableView(){
        tableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.reuseIdentifier())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ChatViewController else {
            return
        }
        vc.recipient = self.selectedUser
    }
}

extension FollowersListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier(), for: indexPath) as! UserTableViewCell
        cell.configure(users[indexPath.row])
        return cell
    }
}

extension FollowersListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: String(describing: ChatViewController.self), sender: self)
        self.selectedUser = users[indexPath.row]
    }
}

