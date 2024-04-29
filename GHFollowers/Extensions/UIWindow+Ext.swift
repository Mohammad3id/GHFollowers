//
//  UIWindow+Ext.swift
//  GHFollowers
//
//  Created by Mohammad Eid on 23/04/2024.
//

import UIKit

extension UIWindow {
    
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
    
}
