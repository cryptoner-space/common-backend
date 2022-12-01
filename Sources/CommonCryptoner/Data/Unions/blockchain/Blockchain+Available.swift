//
//  Blockchain+Available.swift
//  
//
//  Created by skibinalexander on 01.12.2022.
//

import Vapor
import Fluent

extension Blockchain {
    
    public enum App {
        case p2p, wallets
    }
    
    /// Доступные токены
    public static func availableTokens(_ app: App) -> [Blockchain.Token] {
        [.ETH, .TON]
    }
    
}
