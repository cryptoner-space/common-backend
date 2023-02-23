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
    
    // MARK: - Implementation

    public func authenticate(
        bearer: BearerAuthorization,
        for request: Request
    ) -> EventLoopFuture<Void> {
        do {
            let jwt = try request.jwt.verify(bearer.token, as: AuthDevicePayload.self)
            
            request.auth.login(
                AuthSignData(
                    deviceId: jwt.deviceId,
                    userId: jwt.userId
                )
            )
            
            return request.eventLoop.makeSucceededVoidFuture()
        }
        catch {
            return request.eventLoop.makeFailedFuture(Abort(.unauthorized))
        }
   }
    
}

extension AuthMiddleware {
    
    public struct AuthSignData: Content, Authenticatable {
        
        // MARK: - Properties
        
        /// Идентификатор девайса
        public let deviceId: UUID
        
        /// Идентификатор пользователя
        public let userId: UUID
        
        // MARK: - Init
        
        public init(
            deviceId: UUID,
            userId: UUID
        ) {
            self.deviceId = deviceId
            self.userId = userId
        }
        
    }
    
    public struct AuthDevicePayload: JWTPayload, Equatable {
        
        // MARK: - Properties
        
        /// a subject claim
        public var sub: SubjectClaim
        
        /// Expiration
        public var exp: ExpirationClaim // an expiration claim
        
        /// Идентификатор пользователя
        public var userId: UUID
        
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
            deviceId: UUID,
            username: String
        ) {
            self.sub = sub
            self.exp = exp
            self.userId = userId
            self.deviceId = deviceId
            self.username = username
        }
        
    }

    
}
