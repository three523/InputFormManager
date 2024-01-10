//
//  SignUpViewModel.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/07.
//

import UIKit

class SignUpViewModel {
    private let signUpValidation: SignUpValidation
//    private let lodingView: UIView
    weak var delegate: AlertView?
    
    init(signUpValidation: SignUpValidation) {
        self.signUpValidation = signUpValidation
//        self.lodingView = lodingView
    }
    
    func signUp(model: SignUpModel) {
        if let error = signUpValidation.validate(data: model.toJson()) {
            let alertViewModel = AlertViewModel(title: "입력이 잘못되었습니다.", message: error.localizedDescription)
            delegate?.showMessage(alertViewModel: alertViewModel)
        } else {
            
        }
    }
}
