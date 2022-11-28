//
//  Market_Dto+Stock.swift
//  
//
//  Created by skibinalexander on 16.11.2022.
//

import Vapor

extension Market_Dto {
    
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
    
    
}
