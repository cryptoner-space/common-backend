//
//  AuthMiddleware+JWT.swift
//  
//
//  Created by skibinalexander on 04.08.2023.
//

import Foundation
import JWT

public enum JWTSubject: String {
    case authorization
    
    public var claim: SubjectClaim {
        return .init(value: self.rawValue)
    }
}
