//
//  P2P+Extensions.swift
//  
//
//  Created by skibinalexander on 23.12.2022.
//

import Foundation
import Vapor

extension Array where Element == Market_Dto.Agregate.Item {

    public func find(by token: Blockchain.Token) throws -> Element {
        guard let element = self.first(where: { $0.crypto.symbol == token.rawValue }) else {
            throw Abort(.notFound)
        }
        
        return element
    }
    
}
