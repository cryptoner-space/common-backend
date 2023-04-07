//
//  TONProviderAdapter.swift
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

final class TONProviderAdapter: ProviderAdapter {
    
    public var blockchain: Blockchain = .toncoin
    public var input: RequestOperation<FullOperationDependencies>!
    
    public init() throws {}
    
    func updateInfoWallet(id: UUID, for address: String) throws -> EventLoopFuture<ProviderWalletInfoData> {
        guard let input = self.input else { throw Abort(.internalServerError) }
        
        let url = try ProviderUrlBuilder(host: .init(input.app.environment), adapter: .ton)
            .remoteUrl(paths: .adapterPath(.info))
        
        return input.client.get(url) {
            $0.headers.contentType = .json
            try $0.query.encode(TON_Dto.Info.Req(address: address))
        }
        .flatMapThrowing { res in
            input.logger.info(Logger.Message(stringLiteral: "GET \(url) -> \(res.status.code)"))
            
            guard res.status == .ok else { throw Abort(res.status) }
            return try self.mapData(from: res.content.decode(TON_Dto.Info.Res.self))
        }
    }
    
    func mapData(from dto: TON_Dto.Info.Res) throws -> ProviderWalletInfoData {
        return ProviderWalletInfoData(
            coin: .init(entity: .TON, status: .ACTIVE, balance: dto.balance),
            token: []
        )
    }
    
}
