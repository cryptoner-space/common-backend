//
//  MerchantWalletDto.swift
//  
//
//  Created by skibinalexander on 01.11.2022.
//

import Vapor

public struct MerchantWalletDto {
    
    public struct Req: Content {
        
        /// Идентификатор мерчанта
        public let merchantId: UUID
        
        /// Идентификатор кошелька
        public let walletId: String
        
    }
    
    public struct Res: Content {
        
        /// Идентификатор связки мерчант кошелек
        public let id: UUID
        
        /// Дата создания
        public let createdAt: Date?
        
        /// Идентификатор кошелька в сервисе кошельков
        public let walletId: String
        
        /// Модель мерчанта
        public let merchant: MerchantDto.Res
        
    }
    
}
