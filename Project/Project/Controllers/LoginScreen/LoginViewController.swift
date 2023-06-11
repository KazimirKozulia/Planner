//
//  LoginViewController.swift
//  Project
//
//  Created by Ghost on 15.03.23.
//

import UIKit
import FirebaseAnonymousAuthUI

class LoginViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var loginView: LoginView!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.tintColor = UIColor(named: "CyanTextColor")
        loginButton.setTitle(L10n.Login.Button.title, for: .normal)

        configureTitle(label: titleLabel, colorLetter: L10n.Welcome.Label.firstLetter, mainText: L10n.Welcome.Label.halfText)
        
        backgroundStyle(imageName: "BackgroundImage")
        
        loginView.didTapSignUp = {
            let signUpScreen = UIStoryboard(name: "SignUp", bundle: .main).instantiateInitialViewController()
            self.navigationController?.setViewControllers([signUpScreen!], animated: true)       }
        }
    
    @IBAction
    func loginButtonTapped(_ sender: UIButton) {
        FirebaseAnonymousAuthUI.Auth.auth().signInAnonymously()
        let homeScreen = UIStoryboard(name: "HomeScreen", bundle: .main).instantiateInitialViewController()
        self.navigationController?.setViewControllers([homeScreen!], animated: true)
        (homeScreen as? UITabBarController)?.viewControllers?.forEach { $0.loadViewIfNeeded() }
    }
}




