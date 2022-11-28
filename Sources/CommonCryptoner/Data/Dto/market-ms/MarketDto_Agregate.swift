//
//  Market_AggregateDto.swift
//  
//
//  Created by skibinalexander on 15.11.2022.
//

import Vapor

extension Market_Dto {
    
    public struct Agregate {
        
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
            
            /// Криптовалюта
            public let crypto: Currency.Crypto
            
            /// Фиатная валюта
            public let fiat: Currency.Fiat
            
            /// Стоимость валюты в фиатном выражении
            public let stock: Market_Dto.Stock
            
            // MARK: - Init
            
            public init(
                crypto: Currency.Crypto,
                fiat: Currency.Fiat,
                stock: Market_Dto.Stock
            ) {
                self.crypto = crypto
                self.fiat = fiat
                self.stock = stock
            }
        }
        
    }
    
}
