//
//  Localization.swift
//  
//
//  Created by Alexander Skibin on 24.10.2024.
//

import Foundation
import Vapor

enum Localization: String {
    case en, ru
    
    static let `default`: Localization = .en
}

// MARK: - JSONSubscriptType

extension Localization: JSONSubscriptType {
    var jsonKey: JSONKey {
        JSONKey.key(rawValue)
    }
}

// MARK: - Request + Localization

extension Request {
    var currentLocalization: Localization {
        let locale = self.headers.first(name: "locale")
        return Localization(rawValue: locale ?? "") ?? Localization.default
    }
}
