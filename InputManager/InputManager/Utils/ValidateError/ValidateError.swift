//
//  ValidateError.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/07.
//

import Foundation

typealias FieldName = String
typealias ConfirmFieldName = String

enum ValidateError: Error, Equatable {
    case requiredEmpty(String)
    case emailValidate
    case passwordValidate
    case confirm(FieldName, ConfirmFieldName)
}

extension ValidateError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emailValidate:
            return NSLocalizedString("Email is not Validate", comment: "")
        case .passwordValidate:
            return NSLocalizedString("Password is not Validate", comment: "")
        case .confirm(let fieldName, let confirmFieldName):
            return NSLocalizedString("\(fieldName) and \(confirmFieldName) are not the same", comment: "")
        case .requiredEmpty(let fieldLabel):
            return NSLocalizedString("\(fieldLabel) is Empty", comment: "")
        }
    }
}
