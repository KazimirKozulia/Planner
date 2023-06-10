//
//  SignInView.swift
//  Project
//
//  Created by Ghost on 21.03.23.
//

import UIKit

class SignInView: UIView {
    var didTapSignIn: (() -> Void)?

    lazy var signInButton = makeDefaultButton(action: .init(handler: { [weak self] _ in self?.didTapSignIn?() }), title: L10n.SignIn.Button.title)

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
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(signInButton)
        
        NSLayoutConstraint.activate([

            signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            signInButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
    }

}

