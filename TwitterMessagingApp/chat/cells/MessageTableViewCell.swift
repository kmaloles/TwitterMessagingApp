//
//  MessageTableViewCell.swift
//  TwitterMessagingApp
//
//  Created by Kevin Maloles on 9/20/19.
//  Copyright © 2019 Kevin Maloles. All rights reserved.
//

import Foundation
import UIKit

class MessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chatBubbleView: ChatBubbleView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func prepareForReuse() {
        messageLabel.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with message: Message, manager: TwitterManager){
        let messageIsIncoming = message.sender.idStr != manager.activeSessionUserID
        messageLabel.text = message.body
        chatBubbleView.isIncoming = messageIsIncoming
        messageLabel.textAlignment = messageIsIncoming ? .left : .right
    }
    
}
