//
//  YandexMiddleware.swift
//  
//
//  Created by skibinalexander on 26.03.2023.
//

import Vapor
import BlockchainSdk
import CommonCryptonerData
import CommonVapor

extension Request {
    
    public func yandexMiddleware() throws -> YandexMiddleware {
        guard let middleware = self
            .application
            .middleware
            .resolve()
            .first(where: { ($0 as? YandexMiddleware) != nil }) as? YandexMiddleware
        else {
            throw Abort(.notFound, reason: "YandexMiddleware -> middleware not found")
        }
        
        return middleware
    }
    
}

public final class YandexMiddleware: Middleware {
    
    var bearerToken: String?
    
    // MARK: - Middleware
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        request.eventLoop.future().tryFlatMap {
            try self.iam(on: request)
        }.flatMap { iamToken in
            self.bearerToken = iamToken
            return next.respond(to: request)
        }
    }
    
    // MARK: - Private Implementation
    
    private func iam(on request: Request) throws -> EventLoopFuture<String> {
        return request.client.get(
            .init(string: "http://169.254.169.254/computeMetadata/v1/instance/service-accounts/default/token")
        ) { req in
            req.headers.add(name: "Metadata-Flavor", value: "Google")
        }.flatMapThrowing { res in
            guard res.status == .ok else {
                throw Abort(.serviceUnavailable, reason: "Google Service unavailable after request!")
            }
            
            return try res.content.get(String.self, at: "access_token")
        }
    }
    
}
