//
//  OrderDto.swift
//  
//
//  Created by skibinalexander on 31.10.2022.
//

import Vapor

public struct OrderDto {
    
    public struct Sale {
        
        public struct Req: Content {
            
            /// Идентификатор мерчанта
            public let merchantId: UUID
            
            /// Токен криптовалюты
            public let token: Blockchain.Token
            
            /// Доступное количество валюты к продаже
            public let available: Double
            
            /// Минимальная сумма сделки
            public let limitMinValue: Double
            
            /// Максимальная сумма сделки
            public let limitMaxValue: Double
            
        }
        
        public struct Res: Content {
            
            /// Идентификатор заявки
            public let id: UUID
            
            /// Токен заявки
            public let token: Blockchain.Token
            
            /// Доступное количство криптовалюты к продаже [nano]
            public let available: Double
            
            /// Минимальная сумма сделки криптовалюты [nano]
            public let limitMinValue: Double
            
            /// Максимальная сумма сделки крипто [nano]
            public let limitMaxValue: Double
            
        }
        
    }
    
}
