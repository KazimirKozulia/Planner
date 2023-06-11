//
//  ViewController.swift
//  Project
//
//  Created by Ghost on 24.02.23.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var label: UILabel!
    @IBOutlet var signUpView: SignUpView!
    @IBOutlet var emailTextField: SignTextField!
    @IBOutlet var passwordTextField: SignTextField!
    @IBOutlet var confirmPasswordTextField: SignTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.keyboardType = .emailAddress
        emailTextField.textField.autocapitalizationType = .none
        
        signUpView.didTapSignUp = {
            guard let email = self.emailTextField.textField.text, !email.isEmpty,
                  let password = self.passwordTextField.textField.text, !password.isEmpty,
                  let confirmPassword = self.confirmPasswordTextField.textField.text, !confirmPassword.isEmpty else {
                return
            }
                        
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {
                [weak self] result, error in
                guard let strongSelf = self else {
//                    let _ = confirmPassword == password
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
    
        emailTextField.loadView()
        
        backgroundStyle(imageName: "BackgroundImage")
        
        configureTitle(label: label, colorLetter: L10n.Create.Label.firstLetter, mainText: L10n.Create.Label.halfText)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChangeFrame(_:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
    }

    func showCreateAccount(email: String, password: String) {
        let alert = UIAlertController(title: L10n.Alert.Create.title,
                                      message: L10n.Alert.Create.label,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: L10n.Alert.Continue.title,
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
        
        alert.addAction(UIAlertAction(title: L10n.Alert.Cancel.title,
                                      style: .cancel,
                                      handler: {_ in
            
        }))
        
        present(alert, animated: true)
    }
    
    @IBAction
    func backgroundTappen(_ sender: UITapGestureRecognizer) {
        view.endEditing(false)
        
    }
    
    @objc
    func keyboardWillChangeFrame(_ notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0,
                                               bottom: scrollView.frame.maxY - keyboardFrame.minY, right: 0.0)
        
       let textFields = [emailTextField!, passwordTextField!, confirmPasswordTextField!]
        
        if let firstResponder = textFields
            .first(where: \.isFirstResponder) {

            let frame = firstResponder.frame.inset(by: UIEdgeInsets(top: -10,
                                                                    left: -10,
                                                                    bottom: -10,
                                                                    right: -10))

            let newOrigin = scrollView.convert(frame.origin, from: firstResponder.superview)
            let newFrame = CGRect(origin: newOrigin, size: frame.size)

            scrollView.scrollRectToVisible(newFrame, animated: true)
        }
        
    }
    
}



