//
//  Validator.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/07.
//

import Foundation

protocol validatable {
    func validate(data: [String: Any]?) -> ValidateError?
}
