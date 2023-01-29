//
//  AccountMiddleware.swift
//  
//
//  Created by skibinalexander on 21.11.2022.
//

import BlockchainSdk
import CommonCryptonerData
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
    
    public func fetchAccount(by accountId: String) throws -> EventLoopFuture<CAS_Dto.Account.Res> {
        client.eventLoop.future().tryFlatMap {
            self.cache.get(kAccountMiddlewareCacheKeyAccountPrefix+accountId, as: CAS_Dto.Account.Res.self)
        }.tryFlatMap { cacheAccount in
            if let cacheAccount = cacheAccount {
                return self.client.eventLoop.makeSucceededFuture(cacheAccount)
            } else {
                return try self.loadAccount(accountId: accountId).tryFlatMap{ dtoAccount in
                    return self.insertCache(account: dtoAccount, by: accountId)
                }
            }
        }
    }
    
    public func fetchWallets(by accountId: String) throws -> EventLoopFuture<[CAS_Dto.Wallet.Res]> {
        try self.fetchAccount(by: accountId).flatMapThrowing { dtoAccount in
            return dtoAccount.wallets
        }
    }
    
    public func fetchStocks(
        tokens: [BlockchainToken]
    ) throws -> EventLoopFuture<Market_Dto.Agregate.Res> {
        guard let fiat = try? self.query.get(Fiat.self, at: "fiat") else {
            throw Abort(.badRequest)
        }
        
        return try self.blockchain.market(tokens: tokens, fiat: fiat)
    }
    
    // MARK: - Private Implementation
    
    private func insertCache(account: CAS_Dto.Account.Res, by accountId: String) -> EventLoopFuture<CAS_Dto.Account.Res> {
        client.eventLoop.future().tryFlatMap {
            self.cache.set(
                kAccountMiddlewareCacheKeyAccountPrefix+accountId,
                to: account,
                expiresIn: .minutes(3)
            )
        }.flatMapThrowing {
            return account
        }
    }
    
    private func loadAccount(
        accountId: String
    ) throws -> EventLoopFuture<CAS_Dto.Account.Res> {
        let url = IntegrationUrlBuilder(
            host: .init(env, service: .cas)
        )
        .remoteUrl(
            paths: .accounts,
            parameter: accountId
        )
        
        return client
            .get(url) { $0.headers.contentType = .json }
            .flatMapThrowing { res in
                self.logger.info(Logger.Message(stringLiteral: "GET \(url) -> \(res.status.code)"))
                guard res.status == .ok else { throw Abort(res.status) }
                return try res.content.decode(CAS_Dto.Account.Res.self)
            }
    }
    
}
