//
//  CBS+OrderDto.swift
//  
//
//  Created by skibinalexander on 30.11.2022.
//

import Vapor

extension CBS_Dto {
    
    public struct Order {
        
        public struct Create {
            
            public struct Req: Content {
                
                /// Идентификатор владельца операции
                public let ownerId: String
                
                /// Токен операции
                public let token: Blockchain.Token
                
                /// Сумма операции
                public let value: Int64
                
                /// Тип операции
                public let type: CBS_Union.OrderTypeEnum
                
                // MARK: - Init
                
                public init(
                    ownerId: String,
                    token: Blockchain.Token,
                    value: Int64,
                    type: CBS_Union.OrderTypeEnum
                ) {
                    self.ownerId = ownerId
                    self.token = token
                    self.value = value
                    self.type = type
                }
                
            }
            
            public struct Res: Content {
                
                /// Идентификатор владельца операции
                public let ownerId: String
                
                /// Сотрудник обслуживающий операцию
                public let employee: CBS_Dto.Employee.Res?
                
                /// Токен операции
                public let token: Blockchain.Token
                
                /// Сумма операции
                public let value: Int64
                
                /// Тип операции
                public let type: CBS_Union.OrderTypeEnum
                
                /// Статус операции
                public let status: CBS_Union.OrderStatusEnum
                
                // MARK: - Init
                
                public init(
                    ownerId: String,
                    employee: CBS_Dto.Employee.Res?,
                    token: Blockchain.Token,
                    value: Int64,
                    type: CBS_Union.OrderTypeEnum,
                    status: CBS_Union.OrderStatusEnum
                ) {
                    self.ownerId = ownerId
                    self.employee = employee
                    self.token = token
                    self.value = value
                    self.type = type
                    self.status = status
                }
                
            }
            
        }
        
        public struct Pending {
            
            public struct Req: Content {
                
                /// Идентификатор
                let id: UUID
                
                /// Идентификатор владельца транзакции
                let ownerId: String
                
            }
            
        }
        
        public struct Authorized {
            
            public struct Req: Content {
                
                /// Идентификатор
                let id: UUID
                
                /// Идентификатор владельца транзакции
                let ownerId: String
                
            }
            
        }
        
    }
    
}
