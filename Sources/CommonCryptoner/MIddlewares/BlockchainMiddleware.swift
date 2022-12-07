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
            throw Abort(.notFound, reason: "BlockchainMiddleware -> middleware not found")
        }
        
        return middleware
    }
    
}

public final class BlockchainMiddleware: Middleware {
    
    // MARK: - Init
    
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
        let url = IntegrationUrlBuilder(
            host: .init(env, service: .market)
        )
        .remoteUrl(paths: .stock)
        
        return req.client.get(url) {
            $0.headers.contentType = .json
            try $0.query.encode(Market_Dto.Agregate.Req(fiat: fiat, tokens: tokens))
        }
        .flatMapThrowing { res in
            guard res.status == .ok else { throw Abort(res.status) }
            return try res.content.decode(Market_Dto.Agregate.Res.self)
        }
    }
    
}

