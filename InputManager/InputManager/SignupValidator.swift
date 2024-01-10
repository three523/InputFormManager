//
//  SignupValidator.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/06.
//

import UIKit

class SignupPresenter {
    
    private var email: String = ""
    private var password: String = ""
    private var passwordConfirm: String = ""
    
    func validateEmail(email: String) {
        print(email)
        self.email = email
    }
    
    @objc func validateEmail2(textField: UITextField) {
        print(textField.text)
    }
    
    @objc
    func validatePassword(password: String) {
        self.password = password
    }
    
    @objc
    func validatePasswordConfirm(passwordConfirm: String) {
        self.passwordConfirm = passwordConfirm
    }
    
    func validateField(field: String) {
        let formDatas = [
            "email": self.email,
            "password": self.password,
            "passwordConfirm": self.passwordConfirm
        ]
        
        let signup = SingupValidator()
    }
}

class SingupValidator {
    
    func isValidate(field: String, input: [String: String]) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return input[field]?.isEmpty ?? false || emailPredicate.evaluate(with: input[field])
    }
}
