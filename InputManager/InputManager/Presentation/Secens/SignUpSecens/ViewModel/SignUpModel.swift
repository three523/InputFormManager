//
//  SignUpModel.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/07.
//

import Foundation

struct SignUpModel: Model {
    var email: String?
    var password: String?
    var passwordConfirm: String?
    var phoneNumber: String?
    
    init(email: String? = nil, password: String? = nil, passwordConfirm: String? = nil, phoneNumber: String? = nil) {
        self.email = email
        self.password = password
        self.passwordConfirm = passwordConfirm
        self.phoneNumber = phoneNumber
    }
    
    func toSignUpEntity() -> SignUpEntity {
        return SignUpEntity(email: email!, password: password!, passwordConfirm: passwordConfirm!, phoneNumber: phoneNumber!)
    }
}
