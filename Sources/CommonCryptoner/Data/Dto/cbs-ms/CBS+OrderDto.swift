//
//  CBS+OrderDto.swift
//  
//
//  Created by skibinalexander on 30.11.2022.
//

import Vapor

extension CBS_Dto {
    
    public struct Order {
        
        public struct Req: Content {
            
            /// Идентификатор владельца операции
            let ownerId: String
            
            /// Токен операции
            let token: Blockchain.Token
            
            /// Сумма операции
            let value: Int64
            
            /// Тип операции
            let type: CBS_Union.OrderTypeEnum
            
        }
        
        public struct Res: Content {
            
            /// Идентификатор владельца операции
            let ownerId: String
            
            /// Сотрудник обслуживающий операцию
            let employee: CBS_Dto.Employee.Res?
            
            /// Токен операции
            let token: Blockchain.Token
            
            /// Сумма операции
            let value: Int64
            
            /// Тип операции
            let type: CBS_Union.OrderTypeEnum
            
            /// Статус операции
            let status: CBS_Union.OrderStatusEnum
            
        }
        
    }
    
}
