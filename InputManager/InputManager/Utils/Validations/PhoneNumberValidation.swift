//
//  PhoneNumberValidation.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/12.
//

import Foundation

final class PhoneNumberValidation: validatable {
    private let fieldName: String
    private let phoneNumberValidator: Validator
    
    init(fieldName: String, phoneNumberValidator: Validator) {
        self.fieldName = fieldName
        self.phoneNumberValidator = phoneNumberValidator
    }
    
    func validate(data: [String : Any]?) -> ValidateError? {
        guard let email = data?[fieldName] as? String,
              phoneNumberValidator.isValid(text: email) else { return .phoneNumberValidate }
        return nil
    }
}
