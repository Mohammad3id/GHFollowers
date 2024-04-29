//
//  GFButton.swift
//  GHFollowers
//
//  Created by Mohammad Eid on 06/04/2024.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(backgroundColor: UIColor, title: String, image: UIImage? = nil) {
        self.init(frame: .zero)
        set(backgroundColor: backgroundColor, title: title, image: image)
    }
    
    
    private func configure() {
        configuration = .filled()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func set(backgroundColor: UIColor, title: String, image: UIImage? = nil) {
        configuration?.baseBackgroundColor = backgroundColor
        configuration?.baseForegroundColor = .white
        configuration?.title = title
        
        configuration?.image = image
        configuration?.imagePadding = 6
    }
    
}
