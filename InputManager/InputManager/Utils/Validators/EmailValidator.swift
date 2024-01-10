//
//  EmailValidator.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/08.
//

import Foundation

final class EmailValidator: Validator {
    let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    public func isValid(text: String) -> Bool {
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: pattern)
        return regex.firstMatch(in: text, options: [], range: range) != nil
    }
}
