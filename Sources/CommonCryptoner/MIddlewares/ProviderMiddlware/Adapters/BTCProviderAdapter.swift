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
    
    func updateInfoWallet(id: UUID, for address: String) throws -> EventLoopFuture<ProviderWalletInfoData> {
        guard let input = self.input else { throw Abort(.internalServerError) }
        
        let url = try LowLevelUrlBuilder(host: .init(input.app.environment), adapter: .ton)
            .remoteUrl(paths: .adapterPath(.info))
        
        return input.client.get(url) {
            $0.headers.contentType = .json
            try $0.query.encode(BlockBook_Dto.Address.Req(address: address))
        }
        .flatMapThrowing { res in
            input.logger.info(Logger.Message(stringLiteral: "POST \(url) -> \(res.status.code)"))
            
            guard res.status == .ok else { throw Abort(res.status) }
            return try self.mapData(from: res.content.decode(BlockBook_Dto.Address.Res.self))
        }
    }
    
}

extension BTCProviderAdapter {
    
    func mapData(from dto: BlockBook_Dto.Address.Res) throws -> ProviderWalletInfoData {
        guard let balance = Int64(dto.balance) else {
            throw Abort(.internalServerError)
        }
        
        return ProviderWalletInfoData(balance: balance)
    }
    
}
