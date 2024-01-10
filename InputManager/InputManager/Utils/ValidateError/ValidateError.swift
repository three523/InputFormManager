//
//  ValidateError.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/07.
//

import Foundation

enum ValidateError: Error {
    case requiredEmpty(String)
    case emailValidate
    case passwordValidate
    case passwordConfirm
}

extension ValidateError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emailValidate:
            return NSLocalizedString("Email is not Validate", comment: "")
        case .passwordValidate:
            return NSLocalizedString("Password is not Validate", comment: "")
        case .passwordConfirm:
            return NSLocalizedString("Password and PasswordConfirm are not the same", comment: "")
        case .requiredEmpty(let fieldLabel):
            return NSLocalizedString("\(fieldLabel) is Empty", comment: "")
        }
    }
}
