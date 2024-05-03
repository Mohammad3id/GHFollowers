//
//  Constants.swift
//  GHFollowers
//
//  Created by Mohammad Eid on 16/04/2024.
//

import UIKit

enum SFSymbols {
    
    static let location = UIImage(systemName: "mappin.and.ellipse")
    static let repos = UIImage(systemName: "folder")
    static let gists = UIImage(systemName: "text.alignleft")
    static let followers = UIImage(systemName: "heart")
    static let following = UIImage(systemName: "person.2")
    static let people = UIImage(systemName: "person.3")
    static let person = UIImage(systemName: "person")
    
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

    static let isiPhoneSE = idiom == .phone && ScreenSize.maxLength == 667.0
    static let isiPhone8Zoomed = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    
}


enum Images {
    
    static let emptyStateLogo = UIImage(resource: .emptyStateLogo)
    static let placeholder = UIImage(resource: .avatarPlaceholder)
    static let ghLogo = UIImage(resource: .ghLogo)
    
}
