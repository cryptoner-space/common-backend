//
//  AuthMiddleware.swift
//  
//
//  Created by skibinalexander on 23.02.2023.
//

import Vapor
import Fluent
import JWT

public struct AuthMiddleware: BearerAuthenticator {
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Implementation

    public func authenticate(
        bearer: BearerAuthorization,
        for request: Request
    ) -> EventLoopFuture<Void> {
        do {
            let jwt = try request.jwt.verify(bearer.token, as: AuthPayloadJWT.self)
            
            request.auth.login(
                AuthSignData(
                    deviceId: jwt.deviceId,
                    userId: jwt.userId,
                    username: jwt.username
                )
            )
            
            return request.eventLoop.makeSucceededVoidFuture()
        }
        catch {
            return request.eventLoop.makeFailedFuture(Abort(.unauthorized))
        }
   }
    
}

// MARK: - AuthSignData

extension AuthMiddleware {
    
    public struct AuthSignData: Content, Authenticatable {
        
        // MARK: - Properties
        
        /// Идентификатор девайса
        public let deviceId: UUID
        
        /// Идентификатор пользователя
        public let userId: UUID
        
        /// Идентификатор пользователя
        public let username: String
        
        // MARK: - Init
        
        public init(
            deviceId: UUID,
            userId: UUID,
            username: String
        ) {
            self.deviceId = deviceId
            self.userId = userId
            self.username = username
        }
        
    }
    
}

// MARK: - AuthPayloadJWT

extension AuthMiddleware {
    
    public struct AuthPayloadJWT: JWTPayload, Equatable {
        
        // MARK: - Properties
        
        /// a subject claim
        public var sub: SubjectClaim
        
        /// Expiration
        public var exp: ExpirationClaim // an expiration claim
        
        /// Идентификатор пользователя
        public var userId: UUID
        
        /// Идентификатор приватной информации аккаунта пользователя
        public var recoveryId: UUID
        
        /// Device Identifier
        public var deviceId: UUID
        
        /// User Identifier
        public var username: String
        
        // MARK: - Implementation

        public func verify(using signer: JWTSigner) throws {
            try self.exp.verifyNotExpired()
        }
        
        // MARK: - Init
        
        public init(
            sub: SubjectClaim,
            exp: ExpirationClaim,
            userId: UUID,
            recoveryId: UUID,
            deviceId: UUID,
            username: String
        ) {
            self.sub = sub
            self.exp = exp
            self.userId = userId
            self.recoveryId = recoveryId
            self.deviceId = deviceId
            self.username = username
        }
        
    }
    
}
