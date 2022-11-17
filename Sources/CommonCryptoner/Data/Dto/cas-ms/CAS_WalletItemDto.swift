//
//  WalletItem.swift
//  
//
//  Created by skibinalexander on 17.11.2022.
//

import Vapor

extension CAS_Dto {
    
    public struct WalletItem {
        
        public struct Res: Content {
            
            /// Идентификатор счета
            public let id: UUID
            
            /// Дата создания
            public let createdAt: Date?
            
            /// Дата обновления
            public let updatedAt: Date?
            
            /// Токен блокчейна
            public let token: Blockchain.Token
            
            /// Значние токена в кошельке
            public let value: Int64
            
            // MARK: - Init
            
            public init(
                id: UUID,
                createdAt: Date?,
                updatedAt: Date?,
                token: Blockchain.Token,
                value: Int64
            ) {
                self.id = id
                self.createdAt = createdAt
                self.updatedAt = updatedAt
                self.token = token
                self.value = value
            }
            
        }
        
    }
    
}
