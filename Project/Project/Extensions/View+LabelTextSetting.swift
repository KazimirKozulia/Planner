//
//  View.swift
//  Project
//
//  Created by Ghost on 29.05.23.
//

import Foundation
import UIKit

extension UIView {
    
    func makeLabelText(label: UILabel, labelText: String, labelFont: String = "Roboto Bold Italic", labelSize: Int = 25) {
        let text = NSMutableAttributedString(string: labelText)
        
        label.attributedText = text
        
        label.font = UIFont(name: labelFont, size: CGFloat(labelSize))
    }
 
}
