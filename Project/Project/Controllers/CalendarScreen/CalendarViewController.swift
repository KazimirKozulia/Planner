//
//  CalendarViewController.swift
//  Project
//
//  Created by Ghost on 23.03.23.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate {
    
    @IBOutlet
    var tabBar: UITabBarItem!
    
    @IBOutlet
    var calendar: FSCalendar!
    
    @IBOutlet
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.title = L10n.Calendar.TabBarItem.title
                
        calendar.delegate = self
        calendar.backgroundColor = UIColor.setColor(light: UIColor(named: "CalendarColor") ?? .white, dark: UIColor(named: "CalendarColor") ?? .systemGray6)
        
        backgroundStyle(imageName: "SecondBackgroundImage")
        
        label.text = L10n.Date.Label.text
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToNextScreen(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToNextScreen(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    @objc
    func moveToNextScreen(_ sender:UISwipeGestureRecognizer) {
        switch sender.direction{
        case .left:
            self.tabBarController?.selectedIndex = 2
        case .right:
            self.tabBarController?.selectedIndex = 0
        default:
            break
        }
    }
        
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        label.text = string
    }
    
}
