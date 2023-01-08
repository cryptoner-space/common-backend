//
//  BuySaleOrderDto.swift
//  
//
//  Created by skibinalexander on 03.11.2022.
//

import Vapor

extension P2P_Dto {
    
    public struct OrderProposal {
        
        // MARK: - ListDto
        
        public struct List {
            
            public struct Req: Content {
                
                /// Идентификатор владельца операции
                public let merchantId: UUID
                
                /// Статусы заявок
                public let statuses: [P2P_Union.OrderPorposalStatusEnum]
                
                // MARK: - Init
                
                public init(
                    merchantId: UUID,
                    statuses: [P2P_Union.OrderPorposalStatusEnum]
                ) {
                    self.merchantId = merchantId
                    self.statuses = statuses
                }
                
            }
            
        }
        
        // MARK: - EntityDto
        
        public struct Req: Content {
            
            /// Идентификатор заявки продажи
            public let orderId: UUID
            
            /// Идентификатор мерчанта предложения заявки
            public let merchantId: UUID
            
            /// Идентификатор владение сущности подсистемы заявкой
            public let ownerId: String
            
            /// Количество покупки
            public let value: Int64
            
            // MARK: - Init
            
            public init(
                orderId: UUID,
                merchantId: UUID,
                ownerId: String,
                value: Int64
            ) {
                self.orderId = orderId
                self.merchantId = merchantId
                self.ownerId = ownerId
                self.value = value
            }
            
        }
        
    }
    
}
