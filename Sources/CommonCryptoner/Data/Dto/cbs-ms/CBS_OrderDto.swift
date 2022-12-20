//
//  CBS+OrderDto.swift
//  
//
//  Created by skibinalexander on 30.11.2022.
//

import Vapor

extension CBS_Dto {
    
    public struct Order {
        
        public struct Res: Content {
            
            /// Идентификатор заявки
            public let id: UUID
            
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
            
            /// Дата создания операции
            public let createdAt: Date?
            
            // MARK: - Init
            
            public init(
                id: UUID,
                ownerId: String,
                employee: CBS_Dto.Employee.Res?,
                token: Blockchain.Token,
                value: Int64,
                type: CBS_Union.OrderTypeEnum,
                status: CBS_Union.OrderStatusEnum,
                createdAt: Date?
            ) {
                self.id = id
                self.ownerId = ownerId
                self.employee = employee
                self.token = token
                self.value = value
                self.type = type
                self.status = status
                self.createdAt = createdAt
            }
            
        }
        
        public struct List {
            
            public struct Req: Content {
                
                /// Идентификатор владельца операции
                public let ownerIds: [String]
                
                /// Набор статусов для выдачи
                public let statuses: [CBS_Union.OrderStatusEnum]
                
                // MARK: - Init
                
                public init(
                    ownerIds: [String],
                    statuses: [CBS_Union.OrderStatusEnum]
                ) {
                    self.ownerIds = ownerIds
                    self.statuses = statuses
                }
                
            }
            
        }
        
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
                
                /// Дата создания заявки
                public let createdAt: Date?
                
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
                    createdAt: Date?,
                    ownerId: String,
                    employee: CBS_Dto.Employee.Res?,
                    token: Blockchain.Token,
                    value: Int64,
                    type: CBS_Union.OrderTypeEnum,
                    status: CBS_Union.OrderStatusEnum
                ) {
                    self.createdAt = createdAt
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
                public let id: UUID
                
                /// Идентификатор владельца транзакции
                public let ownerId: String
                
                /// Дополнительные данные подписи транзакции
                public let payload: String?
                
                // MARK: - Init
                
                public init(
                    id: UUID,
                    ownerId: String,
                    payload: String?
                ) {
                    self.id = id
                    self.ownerId = ownerId
                    self.payload = payload
                }
                
            }
            
        }
        
        public struct Authorized {
            
            public struct Req: Content {
                
                /// Идентификатор заявки
                public let id: UUID
                
                // MARK: - Init
                
                public init(id: UUID) {
                    self.id = id
                }
                
            }
            
        }
        
        public struct Cancel {
            
            public struct Req: Content {
                
                /// Идентификатор заявки
                public let id: UUID
                
                /// Идентификатор владельца транзакции
                public let ownerId: String
                
                // MARK: - Init
                
                public init(
                    id: UUID,
                    ownerId: String
                ) {
                    self.id = id
                    self.ownerId = ownerId
                }
                
            }
            
        }
        
    }
    
}
