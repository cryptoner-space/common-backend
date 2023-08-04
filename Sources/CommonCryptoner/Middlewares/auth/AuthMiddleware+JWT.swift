//
//  AuthMiddleware+JWT.swift
//  
//
//  Created by skibinalexander on 04.08.2023.
//

import Foundation
import JWT

/// Subject JWT токена
public enum JWTSubject: String {
    
    /// Регистрация
    case registration
    
    /// Авторизация
    case authorization
    
    public var claim: SubjectClaim {
        return .init(value: self.rawValue)
    }
    
}
