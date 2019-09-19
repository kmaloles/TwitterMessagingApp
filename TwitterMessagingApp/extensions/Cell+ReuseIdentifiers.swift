//
//  Cell+ReuseIdentifiers.swift
//  TwitterMessagingApp
//
//  Created by Kevin Maloles on 19/09/2019.
//  Copyright © 2019 Kevin Maloles. All rights reserved.
//

import Foundation
import UIKit


extension UITableViewCell {
    class func nib() -> UINib {
        return UINib(nibName: handyClassName(), bundle: Bundle(for: self))
    }
    
    class func reuseIdentifier() -> String {
        return handyClassName()
    }
    
    class func handyClassName() -> String {
        return String(describing: self)
    }
}
