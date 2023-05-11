//
//  EmployeeAuthMiddleware.swift
//
//
//  Created by skibinalexander on 23.02.2023.
//

import Vapor
import Fluent
import JWT
import CommonVapor

public struct EmployeeAuthMiddleware: BearerAuthenticator {
    
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
            
            request.auth.login(
                AuthSignData(
                    employeeId: jwt.employeeId,
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

extension EmployeeAuthMiddleware {
    
    public struct AuthSignData: Content, Authenticatable {
        
        // MARK: - Properties
        
        /// Идентификатор пользователя
        public let employeeId: UUID
        
        /// Идентификатор пользователя
        public let username: String
        
        // MARK: - Init
        
        public init(
            employeeId: UUID,
            username: String
        ) {
            self.employeeId = employeeId
            self.username = username
        }
        
    }
    
}

// MARK: - AuthPayloadJWT

extension EmployeeAuthMiddleware {
    
    public struct AuthPayloadJWT: JWTPayload, Equatable {
        
        // MARK: - Properties
        
        /// a subject claim
        public var sub: SubjectClaim
        
        /// Expiration
        public var exp: ExpirationClaim // an expiration claim
        
        /// Employee Identifier
        public var employeeId: UUID
        
        /// Employee Identifier
        public var username: String
        
        // MARK: - Implementation

        public func verify(using signer: JWTSigner) throws {
            try self.exp.verifyNotExpired()
        }
        
        // MARK: - Init
        
        public init(
            sub: SubjectClaim,
            exp: ExpirationClaim,
            employeeId: UUID,
            username: String
        ) {
            self.sub = sub
            self.exp = exp
            self.employeeId = employeeId
            self.username = username
        }
        
    }
    
}
