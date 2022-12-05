//
//  MQBase+CAS.swift
//  
//
//  Created by skibinalexander on 02.12.2022.
//

import CommonVapor
import Vapor

extension MQBase {
    
    public struct CAS {
        
        public enum EventId: String {
            case updateWallet
        }
        
        public struct Update: Codable {
            
            /// Идентификатор кошелька
            public let walletId: String
            
            /// Токен обнолвения баланса
            public let token: Blockchain.Token
            
            /// Значение обновления баланса
            public let value: Int64
            
            // MARK: - Init
            
            public init(
                walletId: String,
                token: Blockchain.Token,
                value: Int64
            ) throws {
                self.walletId = walletId
                self.token = token
                self.value = value
            }
            
        }
        
    }
    
}
