//
//  Blockchain.swift
//  
//
//  Created by skibinalexander on 30.10.2022.
//

import Vapor
import Fluent

public enum Blockchain: String, CaseIterable, Codable {
    
    // MARK: - Cases
    
    case Multi
    case Bitcoin
    case Ethereum
    case Toncoin
    case BNB
    
}

extension Blockchain {
    static public let scheme: String = "blockchain_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "blockchain")
    
}
