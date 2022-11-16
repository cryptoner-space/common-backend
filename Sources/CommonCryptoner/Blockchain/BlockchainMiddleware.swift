//
//  BlockchainMiddleware.swift
//  
//
//  Created by skibinalexander on 16.11.2022.
//

import CommonVapor
import Vapor

extension Request {
    
    func blockchain() throws -> BlockchainMiddleware {
        guard let middleware = self
            .application
            .middleware
            .resolve()
            .first(where: { ($0 as? MQService) != nil }) as? BlockchainMiddleware
        else {
            throw Abort(.notFound, reason: "BlockchainMiddleware -> middleware not found")
        }
        
        return middleware
    }
    
}

public struct BlockchainMiddleware: Middleware {
    
    // MARK: - Middleware Implementation
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        return next.respond(to: request)
    }
    
    public func availableTokens(app: Blockchain.App) -> [Blockchain.Token] {
        switch app {
        case .p2p:
            return Blockchain.availableTokensP2P
        case .wallets:
            return Blockchain.availableTokensWallets
        }
    }
    
    /// Получить фиатное значение стоимости блокчейн токена / валюты
    /// - Parameters:
    ///   - blockchainToken: Токен блокчейна
    ///   - client: Клиент запроса
    ///   - env: Инструменты параметров
    public func market(
        blockchainToken: Blockchain.Token ,
        fiat: Fiat,
        on client: Client,
        env: Environment
    ) throws -> EventLoopFuture<Market_Dto.Agregate.Res> {
        let url = IntegrationUrlBuilder(
            host: .init(env, service: .market)
        )
        .remoteUrl(paths: .stock)
        
        return client.get(url) {
            $0.headers.contentType = .json
            try $0.query.encode(Market_Dto.Agregate.Req(fiat: fiat, token: blockchainToken))
        }
        .flatMapThrowing { res in
            guard res.status == .ok else { throw Abort(res.status) }
            return try res.content.decode(Market_Dto.Agregate.Res.self)
        }
    }
    
}

