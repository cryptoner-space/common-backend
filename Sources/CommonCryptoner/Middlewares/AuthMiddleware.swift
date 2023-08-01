//
//  AuthMiddleware.swift
//  
//
//  Created by skibinalexander on 23.02.2023.
//

import Vapor
import Fluent
import JWT
import CommonVapor

public protocol AuthIdentifible: (Authenticatable & Codable) {
    var authId: UUID { get set }
}

public struct AuthMiddleware<P: AuthIdentifible>: BearerAuthenticator {
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Implementation

    public func authenticate(
        bearer: BearerAuthorization,
        for request: Request
    ) -> EventLoopFuture<Void> {
        do {
            let jwt = try request.jwt.verify(bearer.token, as: AuthPayloadJWT<P>.self)
            
            guard
                let subject = JWTSubject(rawValue: jwt.sub.value),
                subject == .authorization
            else {
                return request.eventLoop.makeFailedFuture(Abort(.unauthorized))
            }
            
            request.auth.login(jwt.payload)
            
            return request.eventLoop.makeSucceededVoidFuture()
        }
        catch {
            return request.eventLoop.makeFailedFuture(Abort(.unauthorized))
        }
   }
    
}

// MARK: -

extension AuthMiddleware {
    
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
    
    /// Идентификатор сотрудника
    public let employeeId: String
    
    // MARK: - Init
    
    public init(
        authId: UUID,
        employeeId: String
    ) {
        self.authId = authId
        self.employeeId = employeeId
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
