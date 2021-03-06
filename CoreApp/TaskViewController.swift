//
//  TaskViewController.swift
//  CoreApp
//
//  Created by Pavel Metelin on 18.04.2022.
//

import UIKit
/**/
import CoreData

class TaskViewController: UIViewController {
    /**/
    private let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "New Task"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        createButton(with: "Save Task",
                     andColor: UIColor(red: 21/255, green: 101/255, blue: 194/255, alpha: 194/255),
                     action: UIAction { _ in
            self.save()
        })
    }()
    
    private lazy var cancelButton: UIButton = {
        createButton(with: "Cancel",
                     andColor: .systemRed,
                     action: UIAction { _ in
            self.dismiss(animated: true)
        })
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupSubviews(taskTextField, saveButton, cancelButton)
        setConstraint()
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraint() {
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            taskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    private func createButton(with title: String, andColor color: UIColor, action: UIAction) -> UIButton {
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = color
        buttonConfiguration.attributedTitle = AttributedString(title, attributes: attributes)
        
        return UIButton(configuration: buttonConfiguration, primaryAction: action)
    }
    
    private func save() {
        let task = ToDo(context: viewContext)
    }
}
