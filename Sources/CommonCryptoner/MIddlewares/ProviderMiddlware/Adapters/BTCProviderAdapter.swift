//
//  BTCProviderAdapter.swift
//  
//
//  Created by skibinalexander on 07.04.2023.
//

import Foundation
import Vapor
import Fluent
import BlockchainSdk
import CommonCryptonerData
import CommonVapor

final class BTCProviderAdapter: ProviderAdapter {
    
    public var blockchain: Blockchain = .bitcoin
    
    public var input: RequestOperation<FullOperationDependencies>!
    
    public init() throws {}
    
    func updateInfoWallet(id: UUID, for address: String) throws -> EventLoopFuture<ProviderWalletInfoData?> {
        guard let input = self.input else { throw Abort(.internalServerError) }
        
        let url = try ProviderUrlBuilder(host: .init(input.app.environment), adapter: .btc)
            .remoteUrl(paths: .adapterPath(.info))
        
        return input.client.get(url) {
            $0.headers.contentType = .json
            try $0.query.encode(BlockBook_Dto.Address.Req(address: address))
        }
        .flatMapThrowing { res in
            input.logger.info(Logger.Message(stringLiteral: "GET \(url) -> \(res.status.code)"))
            
            guard res.status == .ok else { return nil }
            return try self.mapData(from: res.content.decode(BlockBook_Dto.Address.Res.self))
        }
    }
    
    func mapData(from dto: BlockBook_Dto.Address.Res) throws -> ProviderWalletInfoData {
        return ProviderWalletInfoData(
            coin: .init(entity: .BTC, status: .ACTIVE, balance: dto.balance),
            tokens: []
        )
    }
    
}
