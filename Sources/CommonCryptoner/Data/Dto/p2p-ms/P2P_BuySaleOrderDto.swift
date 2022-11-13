//
//  BuySaleOrderDto.swift
//  
//
//  Created by skibinalexander on 03.11.2022.
//

import Vapor

extension P2P_Dto {
    
    public struct BuySaleOrderDto {
        
        public struct Req: Content {
            
            /// Идентификатор заявки продажи
            public let orderId: UUID
            
            /// Идентификатор кошелька мерчанта для покупки
            public let walletId: UUID
            
            /// Количество покупки
            public let value: Int64
            
            // MARK: - Init
            
            public init(
                orderId: UUID,
                walletId: UUID,
                value: Int64
            ) {
                self.orderId = orderId
                self.walletId = walletId
                self.value = value
            }
            
        }
        
    }
    
}
