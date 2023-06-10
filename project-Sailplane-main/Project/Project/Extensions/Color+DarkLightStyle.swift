//
//  ColoExtension.swift
//  Project
//
//  Created by Ghost on 23.03.23.
//

import UIKit

extension UIColor {
    
    static func setColor(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection) -> UIColor in
                return traitCollection.userInterfaceStyle == .dark ? dark : light
            }
        } else {
            return light
        }
    }
}
