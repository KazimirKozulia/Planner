//
//  AddNoteViewController.swift
//  Project
//
//  Created by Ghost on 29.05.23.
//

import UIKit

protocol AddNoteViewControllerDelegate {
    func didFinishAddingNote()
}

class AddNoteViewController: UIViewController {
    
    var delegate: AddNoteViewControllerDelegate?

    private var titleField: UITextField = {
        let field = UITextField()
        field.placeholder = L10n.Field.Placeholder.title
        field.textColor = .label
        field.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return field
    }()
    
    private var bodyTextView: UITextView = {
        let view = UITextView()
        view.text = L10n.View.TypeInHere.text
        view.font = UIFont.systemFont(ofSize: 18)
        view.textColor = .placeholderText
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = L10n.Add.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: L10n.BarButtonItem.Save.title, style: .done, target: self, action: #selector(didTapSaveButton))
        bodyTextView.delegate = self
        titleField.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubViews(views: titleField, bodyTextView)
        
        titleField.frame = CGRect(x: 20, y: 120, width: view.width - 40, height: 44)
        bodyTextView.frame = CGRect(x: 16, y: titleField.bottom + 20, width: view.width - 32, height: view.bottom - 250)
    }
    
    @objc
    private func didTapSaveButton() {
        if titleField.text!.isEmpty || bodyTextView.text.isEmpty {
            let alertController = UIAlertController(
                title: L10n.Alert.Enter.title,
                message: L10n.Alert.Enter.message,
                preferredStyle: .alert
            )

            let cancelAction = UIAlertAction(title: L10n.Alert.Ok.title, style: .cancel, handler: nil)
            alertController.addAction(cancelAction)

            present(alertController, animated: true)
            return
        }
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let note = Note(context: managedContext)
        note.title = titleField.text!
        note.body = bodyTextView.text
        note.created = Date.now
        
        do {
            try managedContext.save()
            let alertController = UIAlertController(title: L10n.Alert.Save.title, message: L10n.Alert.Save.message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: L10n.Alert.Ok.title, style: .cancel) { [weak self] _ in
                guard let self = self else { return }
                self.delegate?.didFinishAddingNote()
                self.dismiss(animated: true) {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true)
            
        } catch let error as NSError {
            fatalError("Error saving person to core data. \(error.userInfo)")
        }
    }
}

extension AddNoteViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        titleField.resignFirstResponder()
        if textField == titleField && !titleField.text!.isEmpty {
            bodyTextView.becomeFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleField.resignFirstResponder()
        bodyTextView.becomeFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == bodyTextView && bodyTextView.text == L10n.View.TypeInHere.text{
            textView.text = ""
            bodyTextView.textColor = .label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == bodyTextView && bodyTextView.text.isEmpty {
            textView.text = L10n.View.TypeInHere.text
            bodyTextView.textColor = .placeholderText
        }
    }
}
    
    

