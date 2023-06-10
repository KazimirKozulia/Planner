//
//  SignInViewController.swift
//  Project
//
//  Created by Ghost on 25.02.23.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var signTextField: SignTextField!
    @IBOutlet var signInView: SignInView!
    @IBOutlet var emailTextField: SignTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.keyboardType = .emailAddress
        emailTextField.textField.autocapitalizationType = .none
        
        signInView.didTapSignIn = {
            guard let email = self.emailTextField.textField.text, !email.isEmpty,
                  let password = self.signTextField.textField.text, !password.isEmpty else {
                return
            }
            
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
                guard let strongSelf = self else {
                    return
                }
                
                guard error == nil else {
                    strongSelf.showCreateAccount(email: email, password: password)
                    return
                }
    
            })
            
            let homeScreen = UIStoryboard(name: "HomeScreen", bundle: .main).instantiateInitialViewController()
            self.navigationController?.setViewControllers([homeScreen!], animated: true)
            (homeScreen as? UITabBarController)?.viewControllers?.forEach { $0.loadViewIfNeeded() }
        }
        
        signTextField.loadView()
        
        backgroundStyle(imageName: "BackgroundImage")
        
        configureTitle(label: label, colorLetter: L10n.Login.Label.firstLetter, mainText: L10n.Login.Label.halfText)
        
    }
    
    func showCreateAccount(email: String, password: String) {
        let alert = UIAlertController(title: "Create Account",
                                      message: "Would you like to create an account",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue",
                                      style: .default,
                                      handler: {_ in
            
            FirebaseAuth.Auth.auth().createUser(withEmail: email , password: password, completion: { [weak self] result, error in
                
                guard self != nil else {
                    return
                }
                
                guard error == nil else {
                    return
                }
                
            })
    
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: {_ in
            
        }))
        
        present(alert, animated: true)
    }
    
    @IBAction
    func backgroundTappen(_ sender: UITapGestureRecognizer) {
        view.endEditing(false)
        
    }
    
}
