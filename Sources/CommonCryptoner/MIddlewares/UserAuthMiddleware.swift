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

public struct UserAuthMiddleware: BearerAuthenticator {
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Implementation

    public func authenticate(
        bearer: BearerAuthorization,
        for request: Request
    ) -> EventLoopFuture<Void> {
        do {
            let jwt = try request.jwt.verify(bearer.token, as: AuthPayloadJWT.self)
            
            guard
                let subject = JWTSubject(rawValue: jwt.sub.value),
                subject == .authorization
            else {
                return request.eventLoop.makeFailedFuture(Abort(.unauthorized))
            }
            
            request.auth.login(jwt.data)
            
            return request.eventLoop.makeSucceededVoidFuture()
        }
        catch {
            return request.eventLoop.makeFailedFuture(Abort(.unauthorized))
        }
   }
    
}

// MARK: - AuthSignData

extension UserAuthMiddleware {
    
    public struct AuthSignData: Content, Authenticatable, Equatable {
        
        // MARK: - Properties
        
        /// Идентификатор пользователя
        public let userId: UUID
        
        /// Идентификатор recovery модели восстановления
        public let recoveryId: String
        
        /// Внешний токен идентификатор recovery модели восстановления
        public let externalId: String
        
        // MARK: - Init
        
        public init(
            userId: UUID,
            recoveryId: String,
            externalId: String
        ) {
            self.userId = userId
            self.recoveryId = recoveryId
            self.externalId = externalId
        }
        
    }
    
}

// MARK: - AuthPayloadJWT

extension UserAuthMiddleware {
    
    public struct AuthPayloadJWT: JWTPayload, Equatable {
        
        // MARK: - Properties
        
        /// a subject claim
        public var sub: SubjectClaim
        
        /// Expiration
        public var exp: ExpirationClaim // an expiration claim
        
        /// Модель данных
        public var data: AuthSignData
        
        // MARK: - Implementation

        public func verify(using signer: JWTSigner) throws {
            try self.exp.verifyNotExpired()
        }
        
        // MARK: - Init
        
        public init(
            sub: SubjectClaim,
            exp: ExpirationClaim,
            data: AuthSignData
        ) {
            self.sub = sub
            self.exp = exp
            self.data = data
        }
        
    }
    
}
