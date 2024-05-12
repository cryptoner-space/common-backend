//
//  AuthMiddleware.swift
//  
//
//  Created by skibinalexander on 23.02.2023.
//

import Foundation
import Vapor
import JWT

public protocol AuthIdentifible: (Authenticatable & Codable) {
    var authId: UUID { get set }
}

public struct AuthMiddleware<P: AuthIdentifible>: BearerAuthenticator {
    
    let subject: JWTSubject
    
    // MARK: - Init
    
    public init(_ subject: JWTSubject = .authorization) {
        self.subject = subject
    }
    
    // MARK: - Implementation

    public func authenticate(bearer: BearerAuthorization, for request: Request) -> EventLoopFuture<Void> {
        request.eventLoop
            .future()
            .flatMapThrowing { _ -> AuthPayloadJWT<P> in
                try request.jwt.verify(bearer.token, as: AuthPayloadJWT<P>.self)
            }
            .flatMapThrowing { jwt in
                guard let subject = JWTSubject(rawValue: jwt.sub.value), subject == subject else {
                    throw Abort(.unauthorized, reason: Error.failedSubjectVerification.localizedDescription)
                }
                
                request.auth.login(jwt.payload)
            }
   }
    
}

public extension AuthMiddleware {
    enum Error: LocalizedError {
        case failedSubjectVerification
        
        public var errorDescription: String? {
            switch self {
            case .failedSubjectVerification:
                "Error subject verification"
            }
        }
    }
}
