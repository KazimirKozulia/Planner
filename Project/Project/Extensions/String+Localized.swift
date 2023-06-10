//
//  StringLocalized + Extension.swift
//  Project
//
//  Created by Ghost on 22.03.23.
//

import UIKit

extension String {
    
    func localized() -> String {
        NSLocalizedString(self, comment: "String")
    }
}
