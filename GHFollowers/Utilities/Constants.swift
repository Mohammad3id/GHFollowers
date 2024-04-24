//
//  Constants.swift
//  GHFollowers
//
//  Created by Mohammad Eid on 16/04/2024.
//

import UIKit

enum SFSymbols {
    static let location = "mappin.and.ellipse"
    static let repos = "folder"
    static let gists = "text.alignleft"
    static let followers = "heart"
    static let following = "person.2"
}

enum ScreenSize {
    static let width = UIScreen.current.bounds.size.width
    static let height = UIScreen.current.bounds.size.height
    static let maxLength = max(width, height)
    static let minLength = min(width, height)
}

enum DeviceTypes {
    static let idiom = UIDevice.current.userInterfaceIdiom
    static let nativeScale = UIScreen.current.nativeScale
    static let scale = UIScreen.current.scale
    
    static let isiPhoneSE = idiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone8Zoomed = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
}

enum Images {
    static let ghLogo = UIImage(named: "gh-logo")
}
