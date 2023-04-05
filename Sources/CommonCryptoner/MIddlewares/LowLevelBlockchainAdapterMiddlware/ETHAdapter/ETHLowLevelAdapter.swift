//
//  ETHLowLevelAdapter.swift
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

final class ETHLowLevelAdapter: LowLevelBlockchainAdapter {
    
    public var blockchain: Blockchain = .ethereum
    public var input: RequestOperation<FullOperationDependencies>!
    
    public init() throws {}
    
    func updateInfoWallet(id: UUID, for address: String) throws -> EventLoopFuture<LowLevelAdapterWalletInfoData> {
        guard let input = self.input else { throw Abort(.internalServerError) }
        
        let url = try LowLevelUrlBuilder(host: .init(input.app.environment), adapter: .ton)
            .remoteUrl(paths: .adapterPath(.info))
        
        return input.client.get(url) {
            $0.headers.contentType = .json
            try $0.query.encode(ETH_Dto.Info.Req(address: address))
        }
        .flatMapThrowing { res in
            input.logger.info(Logger.Message(stringLiteral: "POST \(url) -> \(res.status.code)"))
            
            guard res.status == .ok else { throw Abort(res.status) }
            return try self.mapData(from: res.content.decode(ETH_Dto.Info.Res.self))
        }
    }
    
}

extension ETHLowLevelAdapter {
    
    func mapData(from dto: ETH_Dto.Info.Res) throws -> LowLevelAdapterWalletInfoData {
        guard let balance = Int64(dto.balance) else {
            throw Abort(.internalServerError)
        }
        
        return LowLevelAdapterWalletInfoData(balance: balance)
    }
    
}
