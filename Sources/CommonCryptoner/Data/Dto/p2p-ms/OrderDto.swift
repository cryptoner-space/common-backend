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
            let merchantId: UUID
            
            /// Токен криптовалюты
            let token: Blockchain.Token
            
            /// Доступное количество валюты к продаже
            let available: Double
            
            /// Минимальная сумма сделки
            let limitMinValue: Double
            
            /// Максимальная сумма сделки
            let limitMaxValue: Double
            
        }
        
        public struct Res: Content {
            
            /// Идентификатор заявки
            let id: UUID
            
            /// Токен заявки
            let token: Blockchain.Token
            
            /// Доступное количство криптовалюты к продаже [nano]
            let available: Double
            
            /// Минимальная сумма сделки криптовалюты [nano]
            let limitMinValue: Double
            
            /// Максимальная сумма сделки крипто [nano]
            let limitMaxValue: Double
            
        }
        
    }
    
}
