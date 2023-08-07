//
//  AccountMiddleware.swift
//  
//
//  Created by skibinalexander on 21.11.2022.
//

import Vapor
import BlockchainData
import CommonCryptonerData
import CommonVapor

extension Request {
    
    public func accountMiddleware() throws -> AccountMiddleware {
        guard let middleware = self
            .application
            .middleware
            .resolve()
            .first(where: { ($0 as? AccountMiddleware) != nil }) as? AccountMiddleware
        else {
            throw Abort(.notFound, reason: "AccountMiddleware -> middleware not found")
        }
        
        return middleware
    }
    
}

private let kAccountMiddlewareCacheKeyAccountPrefix = "kAccountMiddlewareCacheKeyAccount_"

public final class AccountMiddleware: Middleware {
    
    // MARK: - Public Init
    
    public init() {}
    
    // MARK: - Private Propertioes
    
    private(set) var client: Client!
    private(set) var logger: Logger!
    private(set) var cache: Cache!
    private(set) var env: Environment!
    private(set) var query: URLQueryContainer!
    private(set) var blockchain: BlockchainMiddleware!
    
    // MARK: - Middleware Implementation
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        self.client = request.client
        self.logger = request.logger
        self.cache = request.cache
        self.env = request.application.environment
        self.query = request.query
        
        do {
            self.blockchain = try request.blockchain()
        } catch {
            return request.eventLoop.makeFailedFuture(Abort(.internalServerError))
        }
        
        return next.respond(to: request)
    }
    
}
