//
//  Extension.swift
//  Project
//
//  Created by Ghost on 19.03.23.
//

import UIKit

extension UIViewController {
    
    func backgroundStyle(imageName: String = "BackgroundImage") {
        let imageView = UIImageView()
        imageView.image = .init(named: imageName)
        imageView.contentMode = .scaleToFill
        
        imageView.frame = view.frame
        view.insertSubview(imageView, at: 0)
    }
    
    func configureTitle(label: UILabel, colorLetter: String, mainText: String, secondary text: String = "") {
        let text = NSMutableAttributedString(string: "")
        
        text.append(NSAttributedString(string: colorLetter, attributes: [
            .foregroundColor: UIColor(named: "CyanTextColor")!
        ]))
        
        text.append(NSAttributedString(string: mainText))
        
        label.attributedText = text
        
        label.font = UIFont(name: "Roboto Bold Italic", size: 35)
        
    }
    
}


