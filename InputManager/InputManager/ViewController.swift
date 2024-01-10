//
//  ViewController.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    private let emailTextField2: UITextField = UITextField()
    @IBOutlet weak var emailTextField: UITextField!
    let signupPresenter: SignupPresenter = SignupPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField2.addTarget(self, action: #selector(signupPresenter.validateEmail2), for: .editingChanged)
        
        view.addSubview(emailTextField2)
        
        emailTextField2.translatesAutoresizingMaskIntoConstraints = false
        emailTextField2.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12).isActive = true
        emailTextField2.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        emailTextField2.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
//        emailTextField.addTarget(self, action: #selector(signupPresenter.validateEmail(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func validateEmail2(_ textField: UITextField) {
        signupPresenter.validateEmail(email: textField.text ?? "")
    }
    
    @IBAction func validateEmail(_ sender: Any) {
        guard let textField = sender as? UITextField,
              let email = textField.text else { return }
        signupPresenter.validateEmail(email: email)
    }
    
}
