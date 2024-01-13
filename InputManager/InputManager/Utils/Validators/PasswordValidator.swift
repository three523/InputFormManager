//
//  PasswordValidator.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/08.
//

import Foundation

final class PasswordValidator: Validator {
    
    let pattern: String = "^(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}"
    
    func isValid(text: String) -> Bool {
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: pattern)
        return regex.firstMatch(in: text, options: [], range: range) != nil
    }
}
