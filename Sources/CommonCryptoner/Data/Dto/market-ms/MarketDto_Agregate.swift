//
//  Market_AggregateDto.swift
//  
//
//  Created by skibinalexander on 15.11.2022.
//

import Vapor

extension Market_Dto {
    
    public struct Agregate {
        
        public struct Item: Content {
            
            /// Криптовалюта
            public let crypto: Currency.Crypto
            
            /// Стоимость валюты в фиатном выражении
            public let stock: Market_Dto.Stock
            
            // MARK: - Init
            
            public init(
                crypto: Currency.Crypto,
                stock: Market_Dto.Stock
            ) {
                self.crypto = crypto
                self.stock = stock
            }
            
        }
        
        // MARK: - Request & Response
        
        public struct Req: Content {
            
            /// Идентификатор фиатной валюты
            public let fiat: Fiat
            
            /// Идентификатор блокчейн токена
            public let token: Blockchain.Token
            
            // MARK: - Init
            
            public init(
                fiat: Fiat,
                token: Blockchain.Token
            ) {
                self.fiat = fiat
                self.token = token
            }
            
        }
        
        public struct Res: Content {
            
            // MARK: - Properties
            
            /// Фиатная валюта
            public let fiat: Currency.Fiat
            
            /// Список криптовалюты + значение
            public let items: [Item]
            
            // MARK: - Init
            
            public init(
                fiat: Currency.Fiat,
                items: [Item]
            ) {
                self.fiat = fiat
                self.items = items
            }
        }
        
    }
    
}
