//
//  YandexMiddleware.swift
//  
//
//  Created by skibinalexander on 26.03.2023.
//

import Vapor

extension Middlewares {
    
    public func yandex() throws -> YandexMiddleware {
        guard let middleware = self.resolve().first(where: { ($0 as? YandexMiddleware) != nil }) as? YandexMiddleware else {
            throw Abort(.notFound, reason: "YandexMiddleware -> middleware not found")
        }
        
        return middleware
    }
    
}

public final class YandexMiddleware: Middleware {
    
    // MARK: - Properties
    
    public var bearerToken: String? = nil
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Middleware
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        if request.application.environment.isRelease {
            return request.eventLoop.future().tryFlatMap {
                try self.iam(on: request.application)
            }.flatMap { iamToken in
                self.bearerToken = iamToken
                return next.respond(to: request)
            }
        } else {
            self.bearerToken = Environment.get("IAM_TOKEN")!
            return next.respond(to: request)
        }
    }
    
    public func iam(on app: Application) throws -> EventLoopFuture<String> {
        return app.client.get(
            .init(string: "http://169.254.169.254/computeMetadata/v1/instance/service-accounts/default/token")
        ) { req in
            req.headers.add(name: "Metadata-Flavor", value: "Google")
            req.headers.contentType = .json
        }.flatMapThrowing { res in
            guard res.status == .ok else {
                throw Abort(.serviceUnavailable, reason: "Google Service unavailable after request!")
            }
            
            let iamData = try res.content.decode(IAM.self, using: JSONDecoder())
            return iamData.access_token
        }
    }
    
    // MARK: - Private Implementation
    
    private func asyncIam(on app: Application) async throws -> String {
        try await iam(on: app).get()
    }
    
}

extension YandexMiddleware {
    fileprivate struct IAM: Content {
        let access_token: String
        let expires_in: Int
        let token_type: String
    }
}
