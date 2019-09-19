//
//  UIView+Circle.swift
//  TwitterMessagingApp
//
//  Created by Kevin Maloles on 19/09/2019.
//  Copyright © 2019 Kevin Maloles. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func asCircle() {
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.clipsToBounds = true;
    }
}


