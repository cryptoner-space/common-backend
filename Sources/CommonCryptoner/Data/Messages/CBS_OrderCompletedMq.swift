//
//  CBS_OrderCompleted.swift
//  
//
//  Created by skibinalexander on 02.12.2022.
//

import Vapor

extension CBS_Mq {
    
    public struct Order {
        
        public struct Completed: Content {
            
            /// Идентификатор заявки
            public let id: UUID
            
            /// Значение изменения стоимости заявки
            public let value: Int64
            
            // MARK: - Init
            
            public init(
                id: UUID,
                value: Int64
            ) {
                self.id = id
                self.value = value
            }
            
        }
        
    }
    
}
