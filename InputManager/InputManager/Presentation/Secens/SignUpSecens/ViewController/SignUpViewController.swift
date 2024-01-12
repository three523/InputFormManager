//
//  SignUpViewController.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/09.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    private let viewModel: SignUpViewModel
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.placeholder = "Email"
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.placeholder = "Password"
        return textField
    }()
    private let passwordConfirmTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.placeholder = "PasswordConfirm"
        return textField
    }()
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.placeholder = "phoneNumber"
        return textField
    }()
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .darkGray
        return button
    }()
    
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }

}

private extension SignUpViewController {
    func setup() {
        setupDelegate()
        addViews()
        setupAutoLayout()
        setupButton()
    }
    
    func setupDelegate() {
        viewModel.delegate = self
    }
    
    func addViews() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(passwordConfirmTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(signUpButton)
    }
    
    func setupAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        let margin: CGFloat = 12
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: margin).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -margin).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: margin).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -margin).isActive = true
        
        passwordConfirmTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: margin).isActive = true
        passwordConfirmTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin).isActive = true
        passwordConfirmTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -margin).isActive = true
        
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.topAnchor.constraint(equalTo: passwordConfirmTextField.bottomAnchor, constant: margin).isActive = true
        phoneNumberTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin).isActive = true
        phoneNumberTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -margin).isActive = true
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -margin).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: margin).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupButton() {
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    @objc func signUp() {
        let signUpModel = SignUpModel(email: emailTextField.text, password: passwordTextField.text, passwordConfirm: passwordConfirmTextField.text, phoneNumber: phoneNumberTextField.text)
        viewModel.signUp(model: signUpModel)
    }
}

extension SignUpViewController: AlertView {
    func showMessage(alertViewModel: AlertViewModel) {
        let alertViewController = UIAlertController(title: alertViewModel.title, message: alertViewModel.message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertViewController, animated: true)
    }
}
