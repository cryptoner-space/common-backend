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

extension AuthMiddleware {
    public final class Signer: Middleware {
        private var app: Application!
        
        public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
            self.app = request.application
            return next.respond(to: request)
        }
        
        func sign<P: Codable>(sub: SubjectClaim, exp: ExpirationClaim, payload: P) throws -> String {
            let signature = try app.jwt.signers.sign(
                AuthMiddleware<AuthSignUserData>.AuthPayloadJWT(
                    sub: sub,
                    exp: exp,
                    payload: payload
                ),
                kid: .private
            )
            
            return signature
        }
    }
}

public extension Middlewares {
    func jwtAuthSigner<P: Codable>() throws -> AuthMiddleware<P>.Signer {
        guard let middleware = self.resolve().first(where: { ($0 as? AuthMiddleware<P>.Signer) != nil }) as? AuthMiddleware<P>.Signer else {
            throw Abort(.notFound, reason: "AuthMiddleware.Signer -> middleware not found")
        }
        
        return middleware
    }
}
