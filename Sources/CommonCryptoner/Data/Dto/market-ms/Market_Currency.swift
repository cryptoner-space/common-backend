//
//  CurrencyDto.swift
//  
//
//  Created by skibinalexander on 15.11.2022.
//

import Vapor

extension Market_Dto {
    
    public struct Currency {
        
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
        
    }
    
    
}
