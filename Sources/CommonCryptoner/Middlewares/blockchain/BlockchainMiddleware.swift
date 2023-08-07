//
//  BlockchainMiddleware.swift
//  
//
//  Created by skibinalexander on 16.11.2022.
//

import Vapor
import BlockchainData
import CommonCryptonerData
import CommonVapor

extension Request {
    
    public func blockchain() throws -> BlockchainMiddleware {
        guard let middleware = self
            .application
            .middleware
            .resolve()
            .first(where: { ($0 as? BlockchainMiddleware) != nil }) as? BlockchainMiddleware
        else {
            throw Abort(.internalServerError, reason: "BlockchainMiddleware -> middleware not found")
        }
        
        return middleware
    }
    
}

private let kBlockchainMiddlewareCacheKey = "kBlockchainMiddlewareCacheKey"

public final class BlockchainMiddleware: Middleware {
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Private Propertioes
    
    private(set) var client: Client!
    private(set) var cache: Cache!
    private(set) var env: Environment!
    
    // MARK: - Middleware Implementation
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        self.cache = request.cache
        self.client = request.client
        self.env = request.application.environment
        
        return next.respond(to: request)
    }
    
    public func availableTokens() -> [Blockchain] {
        Blockchain.allCases
    }
    
}

