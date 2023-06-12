//
//  SignUpView.swift
//  Project
//
//  Created by Ghost on 24.02.23.
//

import UIKit

class LoginView: UIView {
    
    let label: UILabel = UILabel(frame: .zero)
    var didTapSignUp: (() -> Void)?
    
    lazy var signUpButton = makeDefaultButton(action: .init(handler: { [weak self] _ in self?.didTapSignUp?() }), title: L10n.SignUp.Button.title)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
        
    private func setupView() {

        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(signUpButton)
        
        NSLayoutConstraint.activate([

            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: topAnchor, constant: 300.0),
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        makeLabelText(label: label, labelText: L10n.General.or)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 90.0),
        ])
    }
            
}
