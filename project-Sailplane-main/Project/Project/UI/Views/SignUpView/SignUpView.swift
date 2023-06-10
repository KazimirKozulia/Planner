//
//  SignUpView.swift
//  Project
//
//  Created by Ghost on 19.03.23.
//

import UIKit

class SignUpView: UIView {
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

    private func setupView () {
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(signUpButton)
        
        NSLayoutConstraint.activate([

            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
    }
    
}
