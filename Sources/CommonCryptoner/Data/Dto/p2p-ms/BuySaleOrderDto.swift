//
//  BuySaleOrderDto.swift
//  
//
//  Created by skibinalexander on 03.11.2022.
//

import Vapor

public struct BuySaleOrderDto {
    
    public struct Req: Content {
        
        /// Идентификатор заявки продажи
        let orderId: UUID
        
        /// Идентификатор кошелька мерчанта для покупки
        let walletId: UUID
        
        /// Количество покупки
        let value: Int64
        
    }
    
}
