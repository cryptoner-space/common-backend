//
//  CBS_PushTokenDto.swift
//  
//
//  Created by skibinalexander on 20.11.2022.
//

import Vapor

extension CAS_Dto {
    
    public struct Token {
        
        public struct Push {
            
            public struct Req: Content {
                
                /// Идентификатор кошелька
                let walletId: UUID
                
                /// Токен блокчейна
                let token: Blockchain.Token
                
                /// Значение транзакции
                let value: Int64
                
                /// Адрес кошелька списания средств
                let fromAddress: String
                
            }
            
        }
        
        public struct Pull {
            
            public struct Req: Content {
                
                /// Идентификатор кошелька
                let walletId: UUID
                
                /// Токен блокчейна
                let token: Blockchain.Token
                
                /// Значение транзакции
                let value: Int64
                
                /// Значение кошелька вывода средств
                let toAddress: String
                
            }
            
        }
        
    }
    
}
