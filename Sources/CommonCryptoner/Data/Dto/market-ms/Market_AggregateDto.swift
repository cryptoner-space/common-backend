//
//  Market_AggregateDto.swift
//  
//
//  Created by skibinalexander on 15.11.2022.
//

import Vapor

extension Market_Dto {
    
    public struct Agregate {
        
        public struct Res: Content {
            
            // MARK: - Properties
            
            /// Криптовалюта
            public let crypto: CurrencyDto.Crypto
            
            /// Фиатная валюта
            public let fiat: CurrencyDto.Fiat
            
            /// Стоимость валюты в фиатном выражении
            public let stock: CurrencyDto.Stock
            
            // MARK: - Init
            
            public init(
                crypto: CurrencyDto.Crypto,
                fiat: CurrencyDto.Fiat,
                stock: CurrencyDto.Stock
            ) {
                self.crypto = crypto
                self.fiat = fiat
                self.stock = stock
            }
        }
        
    }
    
}
