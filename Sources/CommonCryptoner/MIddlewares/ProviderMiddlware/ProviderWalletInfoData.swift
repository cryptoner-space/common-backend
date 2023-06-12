//
//  ProviderWalletInfoData.swift
//  
//
//  Created by skibinalexander on 03.04.2023.
//

import Foundation
import BlockchainData
import CommonCryptonerData

public struct ProviderWalletInfoData {
    
    public struct Coin {
        public let entity: Blockchain.Coin
        public let status: CAS_Union.WalletItemStatus
        public let balance: String
        
        // MARK: - Init
        
        public init(
            entity: Blockchain.Coin,
            status: CAS_Union.WalletItemStatus,
            balance: String
        ) {
            self.entity = entity
            self.status = status
            self.balance = balance
        }
    }
    
    public struct Token {
        public let entity: Blockchain.Token
        public let status: CAS_Union.WalletItemStatus
        public let balance: String
        
        // MARK: - Init
        
        public init(
            entity: Blockchain.Token,
            status: CAS_Union.WalletItemStatus,
            balance: String
        ) {
            self.entity = entity
            self.status = status
            self.balance = balance
        }
    }
    
    // MARK: - Properties
    
    ///
    public let coin: Coin
    
    ///
    public let tokens: [Token]
    
}
