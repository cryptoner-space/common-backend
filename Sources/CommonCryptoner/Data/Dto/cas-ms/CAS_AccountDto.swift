//
//  CAS_AccountDto.swift
//  
//
//  Created by skibinalexander on 16.11.2022.
//

import Vapor

extension CAS_Dto {
    
    public struct Account {
        
        public struct Req: Content {
            
            /// Идентификатор пользователя
            public let userId: String
            
            /// Тип счета
            public let account: AccountEnum
            
            /// Заголовок счёта
            public let title: String?
            
            // MARK: - Init
            
            public init(
                userId: String,
                account: AccountEnum,
                title: String?
            ) {
                self.userId = userId
                self.account = account
                self.title = title
            }
            
        }
        
        public struct Res: Content {
            
            /// Идентификатор счета
            public let id: UUID
            
            /// Дата создания
            public let createdAt: Date?
            
            /// Дата обновления
            public let updatedAt: Date?
            
            /// Заголовок счета
            public let title: String?
            
            /// Список кошельков счета
            public let wallets: [Wallet.Res]
            
            // MARK: - Init
            
            public init(
                id: UUID,
                createdAt: Date?,
                updatedAt: Date?,
                title: String?,
                wallets: [Wallet.Res]
            ) {
                self.id = id
                self.createdAt = createdAt
                self.updatedAt = updatedAt
                self.title = title
                self.wallets = wallets
            }
            
        }
        
    }
    
}
