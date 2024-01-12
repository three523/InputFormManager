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
            RequiredFieldValidation(fieldName: "email"),
            EmailValidation(fieldName: "email", emailValidator: EmailValidator()),
            RequiredFieldValidation(fieldName: "password"),
            PasswordValidation(fieldName: "password", passwordValidator: PasswordValidator()),
            ConfirmValidation(fieldName: "password", fieldNameToCompare: "passwordConfirm"),
            PhoneNumberValidation(fieldName: "phoneNumber", phoneNumberValidator: PhoneNumberValidator())
        ])
    }
}
