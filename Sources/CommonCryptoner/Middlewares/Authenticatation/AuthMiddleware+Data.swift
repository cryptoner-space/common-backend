//
//  AuthMiddleware+Data.swift
//  
//
//  Created by skibinalexander on 04.08.2023.
//

import Foundation
import Vapor
import JWT

// MARK: -

public struct AuthPayloadJWT<P: Codable>: JWTPayload, Equatable {
    
    public static func == (lhs: AuthPayloadJWT<P>, rhs: AuthPayloadJWT<P>) -> Bool {
        return rhs.exp.value.compare(lhs.exp.value) == .orderedDescending
    }
    
    // MARK: - Properties
    
    /// a subject claim
    public var sub: SubjectClaim
    
    /// Expiration
    public var exp: ExpirationClaim // an expiration claim
    
    /// Данные пользователя
    public var payload: P
    
    // MARK: - Implementation

    public func verify(using signer: JWTSigner) throws {
        try self.exp.verifyNotExpired()
    }
    
    // MARK: - Init
    
    public init(
        sub: SubjectClaim,
        exp: ExpirationClaim,
        payload: P
    ) {
        self.sub = sub
        self.exp = exp
        self.payload = payload
    }
    
}

// MARK: - AuthSignData

public struct AuthSignUserData: AuthenticatableID, Content {
    
    // MARK: - Properties
    
    public var id: UUID
    
    /// Идентификатор recovery модели восстановления
    public let recoveryId: UUID
    
    /// Key value для получения
    public let recoveryKey: String
    
    /// Внешний токен идентификатор recovery модели восстановления
    public let externalId: String
    
    // MARK: - Init
    
    public init(
        id: UUID,
        recoveryId: UUID,
        recoveryKey: String,
        externalId: String
    ) {
        self.id = id
        self.recoveryId = recoveryId
        self.recoveryKey = recoveryKey
        self.externalId = externalId
    }
    
}

public struct AuthSignUniqueData: AuthenticatableID, Content {
    
    // MARK: - Properties
    
    /// Идентификатор авторизации
    public var id: UUID
    
    // MARK: - Init
    
    public init(id: UUID) {
        self.id = id
    }
    
}
