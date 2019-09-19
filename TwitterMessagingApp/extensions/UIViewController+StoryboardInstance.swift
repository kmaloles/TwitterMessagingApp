//
//  UIViewController+StoryboardInstance.swift
//  TwitterMessagingApp
//
//  Created by Kevin Maloles on 19/09/2019.
//  Copyright © 2019 Kevin Maloles. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    static func storyboardInstance<T>(_ storyboardName: String? = nil) -> T {
        let storyboard = UIStoryboard(name: storyboardName ?? String(describing: self), bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
    }
}

