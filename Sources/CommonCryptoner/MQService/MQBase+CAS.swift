//
//  MQBase+CAS.swift
//  
//
//  Created by skibinalexander on 02.12.2022.
//

import Vapor

extension MQBase {
    
    public struct CAS {
        
        public struct UpdateWalletItem: Content {
            
            /// Сервис отправителя
            let source: Microservice.Middle
            
            /// Идентификатор кошелька
            let walletId: String
            
            /// Токен обнолвения баланса
            let token: Blockchain.Token
            
            /// Значение обновления баланса
            let value: Int64
            
        }
        
    }
    
}
