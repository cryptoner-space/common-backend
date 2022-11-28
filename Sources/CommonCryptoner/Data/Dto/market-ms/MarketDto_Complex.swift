//
//  MarketDto_ComplexStock.swift
//  
//
//  Created by skibinalexander on 28.11.2022.
//

import Vapor

extension Market_Dto {
    
    public struct Complex {
        
        public struct Req: Content {
            
            /// Идентификатор фиатной валюты
            public let fiat: Fiat
            
            /// Идентификатор блокчейн токена
            public let tokens: [Blockchain.Token]
            
            /// Дата начала выдачи операций стоимости валют
            public let stocksAt: Date
            
            // MARK: - Init
            
            public init(
                fiat: Fiat,
                tokens: [Blockchain.Token]б
                stocksAt: Date
            ) {
                self.fiat = fiat
                self.tokens = tokens
                self.stocksAt = stocksAt
            }
            
        }
        
        public struct Res: Content {
            
            // MARK: - Properties
            
            /// Криптовалюта
            public let crypto: Currency.Crypto
            
            /// Фиатная валюта
            public let fiat: Currency.Fiat
            
            /// Стоимость валюты в фиатном выражении
            public let stocks: [Market_Dto.Stock]
            
            // MARK: - Init
            
            public init(
                crypto: Currency.Crypto,
                fiat: Currency.Fiat,
                stocks: [Market_Dto.Stock]
            ) {
                self.crypto = crypto
                self.fiat = fiat
                self.stocks = stocks
            }
        }
        
    }
    
}
