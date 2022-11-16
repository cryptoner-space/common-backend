//
//  IntegrationTransactionDto.swift
//  
//
//  Created by skibinalexander on 04.09.2022.
//

import Vapor

public struct IntegrationTransactionDto {
    
    public struct Fee {
        
        public struct Req: Content {
            
            /// Приватный ключ кошелька отправителя
            let privateKey: String
            
            /// Публичный ключ кошелька отправителя
            let publicKey: String
            
            /// Адрес кошелька получетеля
            let address: String
            
            /// Стоимость транзакции
            let amount: Int64
            
        }
        
        public struct Res: Content {
            
            /// Коммисия транзакции
            let fee: Int64
            
        }

    }
    
    public struct Send {
        
        public struct Req: Content {
            
            /// Приватный ключ кошелька отправителя
            let privateKey: String
            
            /// Публичный ключ кошелька отправителя
            let publicKey: String
            
            /// Адрес кошелька получетеля
            let address: String
            
            /// Стоимость транзакции
            let amount: Int64
            
            /// Идентификатор внешней транзакции
            let externalId: String
            
        }

    }
    
}
