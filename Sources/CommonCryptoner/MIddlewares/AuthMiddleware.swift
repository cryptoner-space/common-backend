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
        let deviceId: UUID
        
        /// Идентификатор пользователя
        let userId: UUID
        
    }
    
    struct AuthDevicePayload: JWTPayload, Equatable {
        
        // MARK: - Properties
        
        /// a subject claim
        var sub: SubjectClaim
        
        /// Expiration
        var exp: ExpirationClaim // an expiration claim
        
        /// Идентификатор пользователя
        var userId: UUID
        
        /// Device Identifier
        var deviceId: UUID
        
        /// User Identifier
        var username: String
        
        // MARK: - Implementation

        func verify(using signer: JWTSigner) throws {
            try self.exp.verifyNotExpired()
        }
        
    }

    
}
