//
//  ETHProviderAdapter.swift
//  
//
//  Created by skibinalexander on 05.04.2023.
//

import Foundation
import Vapor
import Fluent
import BlockchainSdk
import CommonCryptonerData
import CommonVapor

final class ETHProviderAdapter: ProviderAdapter {
    
    public var blockchain: Blockchain = .ethereum
    public var input: RequestOperation<FullOperationDependencies>!
    
    public init() throws {}
    
    func updateInfoWallet(id: UUID, for address: String) throws -> EventLoopFuture<ProviderWalletInfoData> {
        guard let input = self.input else { throw Abort(.internalServerError) }
        
        let url = try ProviderUrlBuilder(host: .init(input.app.environment), adapter: .eth)
            .remoteUrl(paths: .adapterPath(.info))
        
        return input.client.get(url) {
            $0.headers.contentType = .json
            try $0.query.encode(BlockBook_Dto.Address.Req(address: address))
        }
        .flatMapThrowing { res in
            input.logger.info(Logger.Message(stringLiteral: "GET \(url) -> \(res.status.code)"))
            
            guard res.status == .ok else { throw Abort(res.status) }
            return try self.mapData(from: res.content.decode(BlockBook_Dto.Address.Res.self))
        }
    }
    
}

extension ETHProviderAdapter {
    
    func mapData(from dto: BlockBook_Dto.Address.Res) throws -> ProviderWalletInfoData {
        return ProviderWalletInfoData(
            coin: .init(entity: .ETH, status: .ACTIVE, balance: dto.balance),
            token: dto.tokens.compactMap {
                guard let token = Blockchain.Token(rawValue: $0.symbol) else {
                    return nil
                }
                
                return .init(entity: token, status: .ACTIVE, balance: $0.balance)
            }
        )
    }
    
}
