//
//  Blockchain.EntityType.swift
//  
//
//  Created by skibinalexander on 07.02.2023.
//

import Vapor
import Fluent
import BlockchainSdk

extension CurrencyType  {
    static public let relation: FieldKey = .init(stringLiteral: "blockchain_type")
}
