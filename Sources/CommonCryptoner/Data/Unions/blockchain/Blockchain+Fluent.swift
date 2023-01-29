//
//  Blockchain.swift
//  
//
//  Created by skibinalexander on 30.10.2022.
//

import BlockchainSdk
import Vapor
import Fluent

extension Blockchain {
    static public let scheme: String = "blockchain_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "blockchain")
}

extension BlockchainToken {
    static public let scheme: String = "blockchain_token_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "blockchain_token")
}
