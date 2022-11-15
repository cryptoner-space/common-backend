//
//  File.swift
//  
//
//  Created by skibinalexander on 15.11.2022.
//

import Vapor

extension Market_Dto {
    
    public struct CurrencyDto {
        
        // MARK: - Requests
        
        public struct List {
            
            public struct Req: Content {
                
                /// Название криптовалюты
                public let cryptos: [String]
                
                /// Название фиатной валюты
                public let fiat: String
                
            }
            
        }
        
        // MARK: - Response
        
        public struct Crypto: Content {
            public let id: UUID
            public let name: String
            public let symbol: String
            public let slug: String
            public let rank: Int
            public let isActive: Bool
            public let logoUrl: String?
            public let description: String?
            
            // MARK: - Currency Init
            
            public init(
                id: UUID,
                name: String,
                symbol: String,
                slug: String,
                rank: Int,
                isActive: Bool,
                logoUrl: String?,
                description: String?
            ) {
                self.id = id
                self.name = name
                self.symbol = symbol
                self.slug = slug
                self.rank = rank
                self.isActive = isActive
                self.logoUrl = logoUrl
                self.description = description
            }
            
        }
        
        public struct Fiat: Content {
            public let id: UUID
            public let name: String
            public let symbol: String
            public let sign: String
            
            // MARK: - Currency Init
            
            public init(
                id: UUID,
                name: String,
                symbol: String,
                sign: String
            ) {
                self.id = id
                self.name = name
                self.symbol = symbol
                self.sign = sign
            }
            
        }
        
        public struct Stock: Content {
            public let price: Double
            public let vChange1d: Double
            public let pChange1d: Double
            public let pChange7d: Double
            public let pChange30d: Double
            public let pChange90d: Double
            
            // MARK: - Stock Init
            
            public init(
                price: Double,
                vChange1d: Double,
                pChange1d: Double,
                pChange7d: Double,
                pChange30d: Double,
                pChange90d: Double
            ) {
                self.price = price
                self.vChange1d = vChange1d
                self.pChange1d = pChange1d
                self.pChange7d = pChange7d
                self.pChange30d = pChange30d
                self.pChange90d = pChange90d
            }
            
        }
        
        public struct Agregate {
            
            public struct Res: Content {
                
                // MARK: - Properties
                
                /// Криптовалюта
                public let crypto: Crypto
                
                /// Фиатная валюта
                public let fiat: Fiat
                
                /// Стоимость валюты в фиатном выражении
                public let stock: Stock
                
                // MARK: - Init
                
                public init(
                    crypto: Crypto,
                    fiat: Fiat,
                    stock: Stock
                ) {
                    self.crypto = crypto
                    self.fiat = fiat
                    self.stock = stock
                }
            }
            
        }
        
    }
    
    
}
