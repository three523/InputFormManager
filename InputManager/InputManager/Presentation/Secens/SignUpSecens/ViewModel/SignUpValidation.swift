//
//  SignUpValidation.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/09.
//

import Foundation

final class SignUpValidation: validatable {
    private let validations: [validatable]
    
    init(validations: [validatable]) {
        self.validations = validations
    }
    
    func validate(data: [String : Any]?) -> ValidateError? {
        for validation in validations {
            if let error = validation.validate(data: data) {
                return error
            }
        }
        return nil
    }
}
