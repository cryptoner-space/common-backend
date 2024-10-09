//
//  JWT+.swift
//  
//
//  Created by skibinalexander on 04.08.2023.
//

import Vapor
import JWT

extension String {
    public var bytes: [UInt8] { .init(self.utf8) }
}

extension JWKIdentifier {
    static public let `public` = JWKIdentifier(string: "public")
    static public let `private` = JWKIdentifier(string: "private")
}

/// Subject JWT токена
public enum JWTSubject: String {
    case registration
    case authorization
    
    public var claim: SubjectClaim {
        return .init(value: self.rawValue)
    }
}
