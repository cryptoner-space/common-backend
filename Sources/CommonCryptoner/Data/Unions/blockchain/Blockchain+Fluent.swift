//
//  Blockchain.swift
//  
//
//  Created by skibinalexander on 30.10.2022.
//

import Vapor
import Fluent
import BlockchainSdk

extension Blockchain {
    static public let relation: FieldKey = .init(stringLiteral: "blockchain")
}
