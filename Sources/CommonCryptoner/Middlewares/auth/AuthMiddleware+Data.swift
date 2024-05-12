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

public struct AuthSignUserData: AuthIdentifible, Content {
    
    // MARK: - Properties
    
    /// Идентификатор авторизации
    public var authId: UUID
    
    /// Идентификатор recovery модели восстановления
    public let recoveryId: UUID
    
    /// Внешний токен идентификатор recovery модели восстановления
    public let externalId: String
    
    // MARK: - Init
    
    public init(
        authId: UUID,
        recoveryId: UUID,
        externalId: String
    ) {
        self.authId = authId
        self.recoveryId = recoveryId
        self.externalId = externalId
    }
    
}

public struct AuthSignEmployeeData: AuthIdentifible, Content {
    
    // MARK: - Properties
    
    /// Идентификатор авторизации
    public var authId: UUID
    
    /// Идентификатор пользователя
    public let userId: UUID
    
    // MARK: - Init
    
    public init(
        authId: UUID,
        userId: UUID
    ) {
        self.authId = authId
        self.userId = userId
    }
    
}

public struct AuthSignServiceData: AuthIdentifible, Content {
    
    // MARK: - Properties
    
    /// Идентификатор авторизации
    public var authId: UUID
    
    /// Идентификатор внешнего сервиса
    public let extenralId: String?
    
    /// Название внешнего сервиса
    public let serviceName: String
    
    // MARK: - Init
    
    public init(
        authId: UUID,
        extenralId: String?,
        serviceName: String
    ) {
        self.authId = authId
        self.extenralId = extenralId
        self.serviceName = serviceName
    }
    
}

public struct AuthSignUniqueData: AuthIdentifible, Content {
    
    // MARK: - Properties
    
    /// Идентификатор авторизации
    public var authId: UUID
    
    // MARK: - Init
    
    public init(authId: UUID) {
        self.authId = authId
    }
    
}
