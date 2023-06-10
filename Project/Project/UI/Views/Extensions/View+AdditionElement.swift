//
//  ViewExtension.swift
//  Project
//
//  Created by Ghost on 21.03.23.
//

import UIKit

extension UIView {
    func makeDefaultButton(action: UIAction, title: String = "Foobar", borderWidth: Double = 1.0, colorNamed: String = "CyanTextColor", lightBackground: UIColor = .white, darkBackground: UIColor = .darkGray, container: AttributeContainer? = nil) -> UIButton {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.borderedProminent()
            if let container {
                configuration.attributedTitle = AttributedString(title, attributes: container)
            } else {
                configuration.title = title
                
            }
            configuration.background.backgroundColor = UIColor.setColor(light: lightBackground, dark: darkBackground)
            configuration.background.cornerRadius = 20.0
            configuration.baseForegroundColor = UIColor(named: colorNamed)
            configuration.background.strokeColor = .black
            configuration.background.strokeWidth = borderWidth
            let button = UIButton(configuration: configuration, primaryAction: action)
            return button
        } else {
            let button = UIButton(type: .system)
            button.setTitle("Sign In", for: .normal)
            button.tintColor = .white
            button.backgroundColor = .systemPink
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 2.0
            
            return button
        }
    }
    
    func makeLabelText(label: UILabel, labelText: String, labelFont: String = "Roboto Bold Italic", labelSize: Int = 25) {
        let text = NSMutableAttributedString(string: labelText)
        
        label.attributedText = text
        
        label.font = UIFont(name: labelFont, size: CGFloat(labelSize))
    }
    
    func addAndCustomizeLabelConstraints(label: UILabel, leadingConstraint: Double, topConstraint: Double) {
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingConstraint),
            label.topAnchor.constraint(equalTo: topAnchor, constant: topConstraint),
        ])
    }
}
