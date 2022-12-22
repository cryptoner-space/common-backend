//
//  BlockchainMiddleware.swift
//  
//
//  Created by skibinalexander on 16.11.2022.
//

import CommonVapor
import Vapor

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
    
    public func availableTokens(app: Blockchain.App) -> [Blockchain.Token] {
        Blockchain.availableTokens(app)
    }
    
    /// Получить фиатное значение стоимости блокчейн токена / валюты
    /// - Parameters:
    ///   - blockchainToken: Токен блокчейна
    ///   - client: Клиент запроса
    ///   - env: Инструменты параметров
    public func market(
        tokens: [Blockchain.Token],
        fiat: Fiat
    ) throws -> EventLoopFuture<Market_Dto.Agregate.Res> {
        client.eventLoop.future().tryFlatMap {
            self.cache.get(kBlockchainMiddlewareCacheKey, as: Market_Dto.Agregate.Res.self)
        }.tryFlatMap { cacheMarket in
            if let cacheMarket = cacheMarket {
                return self.client.eventLoop.makeSucceededFuture(cacheMarket)
            } else {
                return try self.loadMarket(tokens: tokens, fiat: fiat).tryFlatMap{ dtoMarket in
                    return self.insertCacheMarket(dtoMarket)
                }
            }
        }
    }
    
    // MARK: - Private Implementation
    
    private func insertCacheMarket(_ market: Market_Dto.Agregate.Res) -> EventLoopFuture<Market_Dto.Agregate.Res> {
        client.eventLoop.future().tryFlatMap {
            self.cache.set(kBlockchainMiddlewareCacheKey, to: market, expiresIn: .minutes(15))
        }.flatMapThrowing {
            return market
        }
    }
    
    private func loadMarket(
        tokens: [Blockchain.Token],
        fiat: Fiat
    ) throws -> EventLoopFuture<Market_Dto.Agregate.Res> {
        let url = IntegrationUrlBuilder(
            host: .init(env, service: .market)
        )
        .remoteUrl(paths: .stock)
        
        return client.get(url) {
            $0.headers.contentType = .json
            try $0.query.encode(
                Market_Dto.Agregate.Req(fiat: fiat, tokens: tokens)
            )
        }
        .flatMapThrowing { res in
            guard res.status == .ok else { throw Abort(res.status) }
            return try res.content.decode(Market_Dto.Agregate.Res.self)
        }
    }
    
}

