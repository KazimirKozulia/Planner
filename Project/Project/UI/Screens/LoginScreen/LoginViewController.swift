//
//  LoginViewController.swift
//  Project
//
//  Created by Ghost on 15.03.23.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseAnonymousAuthUI

class LoginViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var loginView: LoginView!
    @IBOutlet var loginButton: UIButton!

    private let authUI = FUIAuth.defaultAuthUI()!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.tintColor = UIColor(named: "CyanTextColor")
        loginButton.setTitle(L10n.Login.Button.title, for: .normal)

        configureTitle(label: titleLabel, colorLetter: L10n.Welcome.Label.firstLetter, mainText: L10n.Welcome.Label.halfText)
        
        backgroundStyle(imageName: "BackgroundImage")
        
        loginView.didTapSignUp = {
            let signUpScreen = UIStoryboard(name: "SignUp", bundle: .main).instantiateInitialViewController()
            self.navigationController?.setViewControllers([signUpScreen!], animated: true)       }
        
        loginView.didTapSignIn = {
            let signInScreen = UIStoryboard(name: "SignIn", bundle: .main).instantiateInitialViewController()
            self.navigationController?.setViewControllers([signInScreen!], animated: true)        }
        
//        authUI.delegate = self
        let providers: [FUIAuthProvider] = [
          FUIGoogleAuth(authUI: authUI),
          FUIAnonymousAuth(authUI: authUI),
        ]
        self.authUI.providers = providers

        }
    
    @IBAction
    func loginButtonTapped(_ sender: UIButton) {
//        FirebaseAnonymousAuthUI.Auth.auth().signInAnonymously()
//        FirebaseGoogleAuthUI.Auth.auth().sign
//        if Auth.auth().currentUser != nil {
//            try? authUI.signOut()
//            loginButton.setTitle(Auth.auth().currentUser == nil
//                                 ? "Не Зарегался"
//                                 : "Зарегался", for: .normal)
//        } else {
//            let authViewController = authUI.authViewController()
//            present(authViewController, animated: true)
//        }
    }
}

//extension LoginViewController: FUIAuthDelegate {
//    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
//        loginButton.setTitle(Auth.auth().currentUser == nil
//                             ? "Не Зарегался"
//                             : "Зарегался", for: .normal)
//
//    }
//}

