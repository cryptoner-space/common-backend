//
//  Blockchain.EntityType.swift
//  
//
//  Created by skibinalexander on 07.02.2023.
//

import BlockchainSdk
import Vapor
import Fluent

extension Blockchain.CurrencyType  {
    static public let relation: FieldKey = .init(stringLiteral: "blockchain_entity_type")
}
