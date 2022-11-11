//
//  Blockchain.swift
//  
//
//  Created by skibinalexander on 30.10.2022.
//

import Vapor
import Fluent

private let kNameEthereum: String = "Ethereum"
private let kNameToncoin: String = "Toncoin"

public enum Blockchain: String, CaseIterable, Codable {
    
    // MARK: - Tokens
    
    public enum Token: String, CaseIterable, Codable {
        case ETH, TON
        
        var blockchain: Blockchain {
            switch self {
            case .TON:
                return .Toncoin
            case .ETH:
                return .Ethereum
            }
        }
    }
    
    // MARK: - Cases
    
    case Ethereum
    case Toncoin
    
    // MARK: - Properties
    
    public var token: Token {
        switch self {
        case .Toncoin:
            return .TON
        case .Ethereum:
            return .ETH
        }
    }
    
}

extension Blockchain {
    static let scheme: String = "blockchain_enum_001"
    static let relation: FieldKey = .init(stringLiteral: "blockchain")
    
}

extension Blockchain.Token {
    static let scheme: String = "blockchain_token_enum_001"
    static let relation: FieldKey = .init(stringLiteral: "blockchain_token")
}
