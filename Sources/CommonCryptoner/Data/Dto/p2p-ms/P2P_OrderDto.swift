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
        
        public struct Create: Content {
            
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
            
        }
        
        public struct List {
            
            public struct Req: Content {
                
                /// Идентификатор мерчанта
                public let merchantId: UUID?
                
                /// Токен криптовалюты
                public let token: Blockchain.Token
                
                /// Смещение по списку
                public var offset: Int? = nil
                
                /// Количиство выдачи
                public var limit: Int? = nil
                
                // MARK: - Init
                
                public init(
                    merchantId: UUID?,
                    token: Blockchain.Token,
                    offset: Int?,
                    limit: Int?
                ) {
                    self.membersId = merchantId
                    self.token = token
                    self.offset = offset
                    self.limit = limit
                }
                
            }
            
        }
        
        public struct Res: Content {
            
            /// Идентификатор заявки
            public let id: UUID
            
            /// Данные мерчата заявки
            public let merchant: P2P_Dto.MerchantDto.Res
            
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
                merchant: P2P_Dto.MerchantDto.Res,
                token: Blockchain.Token,
                status: P2P_Union.OrderStatusEnum,
                available: Double,
                limitMinValue: Double,
                limitMaxValue: Double
            ) {
                self.id = id
                self.merchant = merchant
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
                
                /// Средняя стоимость заявок для токена криптовалюты
                public let average: Double
                
                /// Доступное количство заявок
                public let count: Int
                
                // MARK: - Init
                
                public init(
                    token: Blockchain.Token,
                    available: Double,
                    average: Double,
                    count: Int
                ) {
                    self.token = token
                    self.available = available
                    self.average = average
                    self.count = count
                }
                
            }
            
        }
        
    }

    
}
