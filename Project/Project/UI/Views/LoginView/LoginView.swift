//
//  SignUpView.swift
//  Project
//
//  Created by Ghost on 24.02.23.
//

import UIKit

class LoginView: UIView {
    let label: UILabel = UILabel(frame: .zero)
//    private let vc: LoginViewController = LoginViewController()
    var didTapSignUp: (() -> Void)?
    var didTapSignIn: (() -> Void)?
    
    lazy var signUpButton = makeDefaultButton(action: .init(handler: { [weak self] _ in self?.didTapSignUp?() }), title: L10n.SignUp.Button.title)
    
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
    
    func signInButtonTapped() {
        
    }
        
    private func setupView() {

        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(signUpButton)
        
        NSLayoutConstraint.activate([

            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: topAnchor, constant: 350.0),
        ])
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: signUpButton.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 30.0)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        makeLabelText(label: label, labelText: L10n.General.or)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 35.0),
//            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -250),
            
        ])
    }
            
}
