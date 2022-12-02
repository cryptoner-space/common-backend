//
//  MQBase+CAS.swift
//  
//
//  Created by skibinalexander on 02.12.2022.
//

import Vapor

extension MQBase {
    
    public struct CAS {
        
        public struct Update: Content {
            
            /// Сервис отправителя
            public let source: Microservice.Middle
            
            /// Идентификатор кошелька
            public let walletId: String
            
            /// Токен обнолвения баланса
            public let token: Blockchain.Token
            
            /// Значение обновления баланса
            public let value: Int64
            
            // MARK: - Init
            
            public init(
                source: Microservice.Middle,
                walletId: String,
                token: Blockchain.Token,
                value: Int64
            ) throws {
                self.source = source
                self.walletId = walletId
                self.token = token
                self.value = value
            }
            
        }
        
    }
    
}
