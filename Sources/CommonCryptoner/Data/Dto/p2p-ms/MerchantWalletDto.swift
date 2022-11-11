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
        let merchantId: UUID
        
        /// Идентификатор кошелька
        let walletId: String
        
    }
    
    public struct Res: Content {
        
        /// Идентификатор связки мерчант кошелек
        let id: UUID
        
        /// Дата создания
        let createdAt: Date?
        
        /// Идентификатор кошелька в сервисе кошельков
        let walletId: String
        
        /// Модель мерчанта
        let merchant: MerchantDto.Res
        
    }
    
}
