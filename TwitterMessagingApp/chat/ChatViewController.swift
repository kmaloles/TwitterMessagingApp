//
//  ChatViewController.swift
//  TwitterMessagingApp
//
//  Created by Kevin Maloles on 9/20/19.
//  Copyright © 2019 Kevin Maloles. All rights reserved.
//

import Foundation
import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chatTextField: UITextField!
    var recipient: User?
    var messages = [Message]()
    var manager = TwitterManager.shared
    
    override func viewDidLoad() {
        initTableView()
    }
    
    func initTableView(){
        tableView.register(MessageTableViewCell.nib(), forCellReuseIdentifier: MessageTableViewCell.reuseIdentifier())
    }
    
    @IBAction func onSendButtonTapped(_ sender: Any) {
        guard let text = chatTextField.text else {
            return
        }

        guard let user = manager.currentUser, let recipient = self.recipient else {
            return
        }
        let outgoingMessage =  Message(sender: user, recipient: recipient, dateSent: Date(), dateReceived: Date(), body: text)
        let incomingMessage =  Message(sender: recipient, recipient: user, dateSent: Date(), dateReceived: Date(), body: text)
        messages.append(outgoingMessage)
        tableView.reloadData()
        messages.append(incomingMessage)
        tableView.reloadData()
    }
    
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.reuseIdentifier(), for: indexPath) as? MessageTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: messages[indexPath.row], manager: manager)
        return cell
    }
}
