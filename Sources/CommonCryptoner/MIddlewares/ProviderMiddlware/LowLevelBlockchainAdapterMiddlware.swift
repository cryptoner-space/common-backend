//
//  LowLevelCryptoAdapterMiddlware.swift
//  
//
//  Created by skibinalexander on 03.04.2023.
//

import Vapor
import BlockchainSdk
import CommonCryptonerData
import CommonVapor

extension Middlewares {
    
    public func lowLevelBlockchainAdapter() throws -> LowLevelBlockchainAdapterMiddlware {
        guard let middleware = self.resolve()
            .first(where: { ($0 as? LowLevelBlockchainAdapterMiddlware) != nil }) as? LowLevelBlockchainAdapterMiddlware
        else {
            throw Abort(.notFound, reason: "LowLevelBlockchainAdapterMiddlware -> middleware not found")
        }
        
        return middleware
    }
    
}

public final class LowLevelBlockchainAdapterMiddlware: Middleware {
    
    // MARK: - Properties
    
    public var adapters: [LowLevelBlockchainAdapter]
    
    // MARK: - Init
    
    public init() throws {
        self.adapters = try [
            LowLevelBlockchainAdapterFactory.makeAdapter(for: .toncoin)
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
