//
//  AlertView.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/09.
//

import Foundation

protocol AlertView: AnyObject {
    func showMessage(alertViewModel: AlertViewModel)
}

final class AlertViewModel {
    var title: String?
    var message: String?
    
    init(title: String? = nil, message: String? = nil) {
        self.title = title
        self.message = message
    }
}
