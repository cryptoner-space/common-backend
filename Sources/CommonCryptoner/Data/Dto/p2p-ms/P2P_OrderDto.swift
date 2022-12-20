//
//  P2P_Dto_OrderDto.swift
//  
//
//  Created by skibinalexander on 31.10.2022.
//

import Vapor

extension P2P_Dto {
    
    // MARK: - ListDto
    
    public struct List {
        
        public struct Req: Content {
            
            /// Идентификатор владельца операции
            public let merchantId: UUID
            
            /// Статусы заявок
            public let statuses: [P2P_Union.OrderStatusEnum]
            
            // MARK: - Init
            
            public init(
                merchantId: UUID,
                statuses: [P2P_Union.OrderStatusEnum]
            ) {
                self.merchantId = merchantId
                self.statuses = statuses
            }
            
        }
        
    }
    
    // MARK: - EntityDto
    
    public struct Order {
        
        public struct Req: Content {
            
            /// Идентификатор мерчанта
            public let merchantId: UUID
            
            /// Тип операции
            public let type: P2P_Union.OrderTypeEnum
            
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
                type: P2P_Union.OrderTypeEnum,
                token: Blockchain.Token,
                available: Double,
                limitMinValue: Double,
                limitMaxValue: Double
            ) {
                self.merchantId = merchantId
                self.type = type
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
            
            /// Статус заявки
            public let status: P2P_Union.OrderStatusEnum
            
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
                status: P2P_Union.OrderStatusEnum,
                available: Double,
                limitMinValue: Double,
                limitMaxValue: Double
            ) {
                self.id = id
                self.token = token
                self.status = status
                self.available = available
                self.limitMinValue = limitMinValue
                self.limitMaxValue = limitMaxValue
            }
            
        }
        
        // MARK: - CountDto
        
        public struct Count {
            
            public struct Res: Content {
                
                /// Токен заявки
                public let token: Blockchain.Token
                
                /// Доступное количство криптовалюты к продаже [nano]
                public let available: Double
                
                /// Доступное количство заявок
                public let count: Int
                
                // MARK: - Init
                
                public init(
                    token: Blockchain.Token,
                    available: Double,
                    count: Int
                ) {
                    self.token = token
                    self.available = available
                    self.count = count
                }
                
            }
            
        }
        
    }

    
}
