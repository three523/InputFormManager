//
//  SignupProtocol.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/07.
//

import Foundation

protocol SignUpUseCaseProtocol {
    func signup(model: SignUpEntity, completion: @escaping (Result<SignUpEntity, SignUpError>) -> Void)
}
