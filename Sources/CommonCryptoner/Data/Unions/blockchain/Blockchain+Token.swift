//
//  Blockchain+Token.swift
//  
//
//  Created by skibinalexander on 01.12.2022.
//

import Vapor
import Fluent

extension Blockchain {
    
    public enum Token: String, CaseIterable, Codable {
        case BTC, ETH, TON, USDT, USDC, BNB, BUSD
    }
    
}

extension Blockchain.Token {
    static public let scheme: String = "blockchain_token_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "blockchain_token")
}
