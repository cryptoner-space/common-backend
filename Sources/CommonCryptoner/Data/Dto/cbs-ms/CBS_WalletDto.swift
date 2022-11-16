//
//  CBS_Dto_WalletDto.swift
//  
//
//  Created by skibinalexander on 16.11.2022.
//

import Vapor

extension CBS_Dto {
    
    public struct WalletDto {
        
        public struct Res: Content {
            
            /// Идентификатор кошелька
            public let id: UUID
            
            /// Блокчейн токен
            public let token: Blockchain.Token
            
            /// Nano баланс кошелька
            public let balance: Int64
            
            // MARK: - Init
            
            public init(id: UUID, token: Blockchain.Token, balance: Int64) {
                self.id = id
                self.token = token
                self.balance = balance
            }
            
        }
        
    }
    
}
