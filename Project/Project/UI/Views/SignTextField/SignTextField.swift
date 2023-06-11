//
//  SignUpView.swift
//  Project
//
//  Created by Ghost on 25.02.23.
//

import UIKit

class SignTextField: UIView {
    private let backgroundView: UIView = UIView(frame: .zero)
    private let imageView: UIImageView = UIImageView(frame: .zero)
    let textField: UITextField = UITextField(frame: .zero)
    
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
    
    @IBInspectable
    var iconImage: UIImage? {
        get {
            imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    @IBInspectable
    var placeholder: String = "" {
        didSet {
            textField.attributedPlaceholder =
            NSAttributedString(string: NSLocalizedString(placeholder, comment: ""),
                               attributes: [
                                .foregroundColor: UIColor(named: "CyanTextColor",
                                                          in: Bundle(for: Self.self),
                                                          compatibleWith: nil)!,
                                .font: UIFont(name: "Roboto Light Italic", size: 18) ?? .systemFont(ofSize: 18) ])
            
        }
    }
    
    @IBInspectable
    var secureEntry: Bool {
        get {
            textField.isSecureTextEntry
        }
        set {
            textField.isSecureTextEntry = newValue
        }
    }
    
        var keyboardType: UIKeyboardType {
            get {
                textField.keyboardType
            }
            set {
                textField.keyboardType = newValue
            }
        }
    
    private func setupView() {
                
        backgroundView.backgroundColor = UIColor.setColor(light: .white, dark: .darkGray)
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)

        NSLayoutConstraint.activate([
            backgroundView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])

        imageView.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultLow + 1, for: .vertical)

        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
                
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20.0),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 20.0),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.0),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(fieldTapped(_:)))
        backgroundView.addGestureRecognizer(tapGesture)
        
    }
    
    func loadView() {
        textField.becomeFirstResponder()
    }
    
    @objc
    func fieldTapped(_ sender: UITapGestureRecognizer) {
        textField.becomeFirstResponder()
    }
    
    override var isFirstResponder: Bool {
        textField.isFirstResponder
    }
}
    
