//
//  TONLowLevelAdapter.swift
//  
//
//  Created by skibinalexander on 03.04.2023.
//

import Foundation
import Vapor
import Fluent
import BlockchainSdk
import CommonCryptonerData
import CommonVapor

final class TONLowLevelAdapter: LowLevelBlockchainAdapter {
    
    public var blockchain: Blockchain = .toncoin
    public var input: RequestOperation<FullOperationDependencies>!
    
    public init() throws {}
    
    func updateInfoWallet(id: UUID, for address: String) throws -> EventLoopFuture<LowLevelAdapterWalletInfoData> {
        guard let input = self.input else { throw Abort(.internalServerError) }
        
        let url = try LowLevelUrlBuilder(host: .init(input.app.environment), adapter: .ton)
            .remoteUrl(paths: .adapterPath(.info))
        
        return input.client.get(url) {
            $0.headers.contentType = .json
            try $0.query.encode(TON_Dto.Info.Req(address: address))
        }
        .flatMapThrowing { res in
            input.logger.info(Logger.Message(stringLiteral: "POST \(url) -> \(res.status.code)"))
            
            guard res.status == .ok else { throw Abort(res.status) }
            return try self.mapData(from: res.content.decode(TON_Dto.Info.Res.self))
        }
    }
    
}

extension TONLowLevelAdapter {
    
    func mapData(from dto: TON_Dto.Info.Res) throws -> LowLevelAdapterWalletInfoData {
        guard let balance = Int64(dto.balance) else {
            throw Abort(.internalServerError)
        }
        
        return LowLevelAdapterWalletInfoData(balance: balance)
    }
    
}
