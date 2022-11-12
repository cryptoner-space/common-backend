//
//  CBS_TransactionDto.swift
//  
//
//  Created by skibinalexander on 12.11.2022.
//

import Vapor

extension CBS_Dto {
    
    public struct TransactionDto {
        
        public struct Push {
            
            public struct Req: Content {
                
                /// Идентификатор кошелька
                let walletId: UUID
                
                /// Стоимость транзакции
                let value: Int64
                
            }
            
        }
        
    }
    
}
