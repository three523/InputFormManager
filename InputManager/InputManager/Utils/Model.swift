//
//  Model.swift
//  InputManager
//
//  Created by 김도현 on 2024/01/07.
//

import Foundation

protocol Model: Codable, Equatable {
}

extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    func toJson() -> [String: Any]? {
        guard let data = self.toData() else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
    }
}
