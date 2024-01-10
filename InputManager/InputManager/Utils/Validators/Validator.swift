//
//  Validator.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/08.
//

import Foundation

protocol Validator {
    var pattern: String { get }
    func isValid(text: String) -> Bool
}
