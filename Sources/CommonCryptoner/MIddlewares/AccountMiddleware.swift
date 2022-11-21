//
//  AccountMiddleware.swift
//  
//
//  Created by skibinalexander on 21.11.2022.
//

import CommonVapor
import Vapor

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

public final class AccountMiddleware: Middleware {
    
    // MARK: - Public Init
    
    public init() {}
    
    // MARK: - Private Propertioes
    
    private(set) weak var req: Request!
    private(set) var env: Environment!
    
    // MARK: - Middleware Implementation
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        self.req = request
        self.env = request.application.environment
        return next.respond(to: request)
    }
    
    public func fetchAccount(by accountId: String) throws -> EventLoopFuture<CAS_Dto.Account.Res> {
        let url = IntegrationUrlBuilder(
            host: .init(env, service: .cas)
        )
        .remoteUrl(
            paths: .accounts,
            parameter: accountId
        )
        
        return req.client
            .get(url) { $0.headers.contentType = .json }
            .flatMapThrowing { res in
                self.req.logger.info(Logger.Message(stringLiteral: "GET \(url) -> \(res.status.code)"))
                guard res.status == .ok else { throw Abort(res.status) }
                return try res.content.decode(CAS_Dto.Account.Res.self)
            }
    }
    
    public func fetchWallets(by accountId: String) throws -> EventLoopFuture<[CAS_Dto.Wallet.Res]> {
        try self.fetchAccount(by: accountId).flatMapThrowing { dtoAccount in
            return dtoAccount.wallets
        }
    }
    
    public func fetchStocks(
        tokens: [Blockchain.Token]
    ) throws -> EventLoopFuture<[Market_Dto.Agregate.Res]> {
        guard let fiat = try? req.query.get(Fiat.self, at: "fiat") else {
            throw Abort(.badRequest)
        }
        
        let futures = try tokens.map {
            try req
                .blockchain()
                .market(
                    blockchainToken: $0,
                    fiat: fiat
                )
        }
        
        return self.req.client.eventLoop.flatten(futures).flatMapEachThrowing {
            .init(crypto: $0.crypto, fiat: $0.fiat, stock: $0.stock)
        }
    }
    
}
