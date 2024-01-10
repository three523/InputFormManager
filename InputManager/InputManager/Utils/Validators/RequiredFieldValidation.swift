//
//  RequeridInput.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/07.
//

import Foundation

final class RequiredFieldValidation: validatable {
    let fieldName: String
    let fieldLabel: String
    
    init(fieldName: String, fieldLabel: String) {
        self.fieldName = fieldName
        self.fieldLabel = fieldLabel
    }
    
    func validate(data: [String: Any]?) -> ValidateError? {
        guard let fieldText = data?[fieldName] as? String,
              fieldText.isEmpty == false else { return .requiredEmpty(fieldName) }
        return nil
    }
}
