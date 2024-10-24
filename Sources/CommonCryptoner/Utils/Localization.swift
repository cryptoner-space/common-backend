//
//  Localization.swift
//
//
//  Created by Alexander Skibin on 24.10.2024.
//

import Foundation
import Vapor

public enum Localization: String {
    case en, ru
    
    static public let `default`: Localization = .en
}

// MARK: - JSONSubscriptType

extension Localization: JSONSubscriptType {
    public var jsonKey: JSONKey {
        JSONKey.key(rawValue)
    }
}

// MARK: - Request + Localization

extension Request {
    public var currentLocalization: Localization {
        let locale = self.headers.first(name: "locale")
        return Localization(rawValue: locale ?? "") ?? Localization.default
    }
}
