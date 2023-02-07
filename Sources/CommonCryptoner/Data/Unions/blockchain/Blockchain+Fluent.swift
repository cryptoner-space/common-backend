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
    static public let relation: FieldKey = .init(stringLiteral: "blockchain")
}
