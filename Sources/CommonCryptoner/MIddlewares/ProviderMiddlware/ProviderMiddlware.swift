//
//  ProviderMiddlware.swift
//  
//
//  Created by skibinalexander on 03.04.2023.
//

import Vapor
import BlockchainSdk
import CommonCryptonerData
import CommonVapor

extension Middlewares {
    
    public func provider() throws -> ProviderMiddlware {
        guard let middleware = self.resolve()
            .first(where: { ($0 as? ProviderMiddlware) != nil }) as? ProviderMiddlware
        else {
            throw Abort(.notFound, reason: "ProviderMiddlware -> middleware not found")
        }
        
        return middleware
    }
    
}

public final class ProviderMiddlware: Middleware {
    
    // MARK: - Properties
    
    public var adapters: [ProviderAdapter]
    
    // MARK: - Init
    
    public init() throws {
        self.adapters = try [
            ProviderFactory.makeAdapter(for: .toncoin),
            ProviderFactory.makeAdapter(for: .ethereum),
            ProviderFactory.makeAdapter(for: .bitcoin)
        ]
    }
    
    // MARK: - Middleware
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        do {
            try self.adapters.forEach {
                $0.input = try RequestOperation<FullOperationDependencies>(request)
            }
        } catch {
            
        }
        return next.respond(to: request)
    }
    
}
