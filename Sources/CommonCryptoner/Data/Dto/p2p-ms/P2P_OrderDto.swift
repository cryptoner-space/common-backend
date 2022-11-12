//
//  P2P_Dto_OrderDto.swift
//  
//
//  Created by skibinalexander on 31.10.2022.
//

import Vapor

extension P2P_Dto {
    
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
                
                // MARK: - Init
                
                public init(
                    merchantId: UUID,
                    token: Blockchain.Token,
                    available: Double,
                    limitMinValue: Double,
                    limitMaxValue: Double
                ) {
                    self.merchantId = merchantId
                    self.token = token
                    self.available = available
                    self.limitMinValue = limitMinValue
                    self.limitMaxValue = limitMaxValue
                }
                
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
                
                // MARK: - Init
                
                public init(
                    id: UUID,
                    token: Blockchain.Token,
                    available: Double,
                    limitMinValue: Double,
                    limitMaxValue: Double
                ) {
                    self.id = id
                    self.token = token
                    self.available = available
                    self.limitMinValue = limitMinValue
                    self.limitMaxValue = limitMaxValue
                }
                
            }
            
        }
        
    }

    
}
