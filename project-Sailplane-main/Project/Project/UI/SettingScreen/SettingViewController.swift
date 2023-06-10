//
//  SettingViewController.swift
//  Project
//
//  Created by Ghost on 20.03.23.
//
import FirebaseAuth
import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet
    var tabBar: UITabBarItem!
    
    @IBOutlet
    var settingView: SettingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        settingView.themeSwitch.addTarget(self, action: #selector(onClickSwitch(_:)), for: .valueChanged)
        
        tabBarItem.title = L10n.Settings.TabBarItem.title

        settingView.themeSwitch.onTintColor = .systemPink
        settingView.themeSwitch.backgroundColor = .darkGray
        settingView.themeSwitch.layer.cornerRadius = 16
        
        backgroundStyle(imageName: "SecondBackgroundImage")
        
        configureTitle(label: settingView.settingLabel, colorLetter: L10n.Settings.Label.firstLetter, mainText: L10n.Settings.Label.halfText)
        
        settingView.didTapLogout = {
            do {
                try FirebaseAuth.Auth.auth().signOut()
            }
            catch {
                print("")
            }
            
            let loginScreen = UIStoryboard(name: "Login", bundle: .main).instantiateInitialViewController()
            self.navigationController?.setViewControllers([loginScreen!], animated: true)       }
        
        settingView.themeSwitch.isOn = UserDefaults.standard.bool(forKey: "switchSetting")
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToNextScreen(_:)))
        
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(rightSwipe)
    }
    
    @objc
    func moveToNextScreen(_ sender:UISwipeGestureRecognizer) {
        switch sender.direction{
        case .right:
            self.tabBarController?.selectedIndex = 1
        default:
            break
        }
    }
    
    @objc
    func onClickSwitch(_ sender: UISwitch) {
        
        UserDefaults.standard.set(settingView.themeSwitch.isOn, forKey: "switchSetting")
        
        if #available(iOS 13.0, *) {
            let sceneDelegate = view.window
            
            if sender.isOn {
                sceneDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            sceneDelegate?.overrideUserInterfaceStyle = .light
            return
            
        } else { }
    }
    
    @IBAction
    func telegramLinkTapped(_ sender: UIGestureRecognizer) {
        UIApplication.shared.open(URL(string: "https://t.me/KazimirKozulia")!)
    }
    
    @IBAction
    func mailLinkTapped(_ sender: UIGestureRecognizer) {
        UIApplication.shared.open(URL(string: "mailto:kazkozsquad@gmail.com")!)
    }
    
    @IBAction
    func phoneNumberTapped(_ sender: UIGestureRecognizer) {
        UIApplication.shared.open(URL(string: "tel:+375293060675")!)
    }

}

