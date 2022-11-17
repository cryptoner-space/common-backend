//
//  IntegrationTransactionDto.swift
//  
//
//  Created by skibinalexander on 04.09.2022.
//

import Vapor

extension Blockchains_Dto {
    
    public struct Fee {
        
        public struct Req: Content {
            
            /// Приватный ключ кошелька отправителя
            public let privateKey: String
            
            /// Публичный ключ кошелька отправителя
            public let publicKey: String
            
            /// Адрес кошелька получетеля
            public let address: String
            
            /// Стоимость транзакции
            public let amount: Int64
            
            // MARK: - Init
            
            public init(
                privateKey: String,
                publicKey: String,
                address: String,
                amount: Int64
            ) {
                self.privateKey = privateKey
                self.publicKey = publicKey
                self.address = address
                self.amount = amount
            }
            
        }
        
        public struct Res: Content {
            
            /// Коммисия транзакции
            public let fee: Int64
            
            // MARK: - Init
            
            public init(fee: Int64) {
                self.fee = fee
            }
            
        }

    }
    
    public struct Send {
        
        public struct Req: Content {
            
            /// Приватный ключ кошелька отправителя
            public let privateKey: String
            
            /// Публичный ключ кошелька отправителя
            public let publicKey: String
            
            /// Адрес кошелька получетеля
            public let address: String
            
            /// Стоимость транзакции
            public let amount: Int64
            
            /// Идентификатор внешней транзакции
            public let externalId: String
            
            // MARK: - Init
            
            public init(
                privateKey: String,
                publicKey: String,
                address: String,
                amount: Int64,
                externalId: String
            ) {
                self.privateKey = privateKey
                self.publicKey = publicKey
                self.address = address
                self.amount = amount
                self.externalId = externalId
            }
            
        }

    }
    
}
