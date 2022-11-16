//
//  CBS_AccountDto.swift
//  
//
//  Created by skibinalexander on 12.11.2022.
//

import Vapor

extension CBS_Dto {
    
    public struct AccountDto {
        
        public struct Req: Content {
            
            /// Идентификатор пользователя
            public let userId: String
            
        }
        
        public struct Res: Content {
            
            /// Идентификатор счета
            let id: UUID
            
            /// Дата создания
            let createdAt: Date?
            
            /// Дата обновления
            let updatedAt: Date?
            
            /// Список кошельков счета
            let wallets: [WalletDto.Res]
            
        }
        
    }
    
}
