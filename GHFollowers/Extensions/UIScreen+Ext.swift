//
//  UIScreen+Ext.swift
//  GHFollowers
//
//  Created by Mohammad Eid on 23/04/2024.
//

import UIKit

extension UIScreen {
    static var current: UIScreen {
        UIWindow.current!.screen
    }
}
