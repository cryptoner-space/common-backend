//
//  MQBase+CAS.swift
//  
//
//  Created by skibinalexander on 02.12.2022.
//

import BlockchainSdk
import CommonVapor
import Vapor

extension CAS_Mq {
    
    public struct Update: Codable {
        
        /// Идентификатор кошелька
        public let walletId: UUID
        
        /// Токен обнолвения баланса
        public let token: BlockchainToken
        
        /// Значение обновления баланса
        public let value: Int64
        
        // MARK: - Init
        
        public init(
            walletId: UUID,
            token: BlockchainToken,
            value: Int64
        ) throws {
            self.walletId = walletId
            self.token = token
            self.value = value
        }
        
    }
    
}
