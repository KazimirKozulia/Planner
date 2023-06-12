//
//  SettingView.swift
//  Project
//
//  Created by Ghost on 21.03.23.
//

import UIKit
@IBDesignable
class SettingView: UIView {
    
    var didTapLogout: (() -> Void)?
    let themeSwitch: UISwitch = UISwitch(frame: .zero)
    let settingLabel: UILabel = UILabel(frame: .zero)
    let label: UILabel = UILabel(frame: .zero)
    let themeLabel: UILabel = UILabel(frame: .zero)
    let refernceLabel: UILabel = UILabel(frame: .zero)
    var logoutButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var container = AttributeContainer()
        container.font = UIFont(name: "Roboto", size: 25)
        logoutButton = makeDefaultButton(action: .init(handler: { [weak self] _ in self?.didTapLogout?() }), title: L10n.Logout.Button.title, borderWidth: 0.0, colorNamed: "BlueTextColor", lightBackground: .clear, darkBackground: .clear, container: container)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        var container = AttributeContainer()
        container.font = UIFont(name: "Roboto", size: 25)
        logoutButton = makeDefaultButton(action: .init(handler: { [weak self] _ in self?.didTapLogout?() }), title: L10n.Logout.Button.title, borderWidth: 0.0, colorNamed: "BlueTextColor", lightBackground: .clear, darkBackground: .clear, container: container)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    private func setupView() {
        
        addAndCustomizeLabelConstraints(label: themeLabel, leadingConstraint: 40.0, topConstraint: 150.0)
        
        makeLabelText(label: themeLabel, labelText: L10n.Theme.Label.text, labelFont: "Roboto")
        
        addAndCustomizeLabelConstraints(label: label, leadingConstraint: 40.0, topConstraint: 250.0)

        makeLabelText(label: label, labelText: L10n.Ad.Label.text, labelFont: "Roboto")
        
        addAndCustomizeLabelConstraints(label: refernceLabel, leadingConstraint: 40.0, topConstraint: 350.0)
        
        makeLabelText(label: refernceLabel, labelText: L10n.Reference.Label.text, labelFont: "Roboto")
        
        guard let logoutButton else {return}
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),
            logoutButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        settingLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(settingLabel)
            
        NSLayoutConstraint.activate([
            
            settingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            settingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            settingLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        themeSwitch.translatesAutoresizingMaskIntoConstraints = false
        addSubview(themeSwitch)
        
        NSLayoutConstraint.activate([
            
            themeSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            themeSwitch.topAnchor.constraint(equalTo: topAnchor, constant: 150),
        ])

    }

}
