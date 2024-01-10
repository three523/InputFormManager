//
//  ValidationFactory.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/10.
//

import Foundation

final class ValidationFactory {
    static func makeSignUpValidation() -> SignUpValidation {
        return SignUpValidation(validations: [
            RequiredFieldValidation(fieldName: "email", fieldLabel: "Email"),
            RequiredFieldValidation(fieldName: "password", fieldLabel: "Password"),
            EmailValidation(fieldName: "email", emailValidator: EmailValidator()),
            PasswordValidation(fieldName: "password", passwordValidator: PasswordValidator()),
            PasswordConfirmValidation(fieldName: "password", fieldNameToCompare: "passwordConfirm")
        ])
    }
}
