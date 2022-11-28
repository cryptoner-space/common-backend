//
//  Blockchain.swift
//  
//
//  Created by skibinalexander on 30.10.2022.
//

import Vapor
import Fluent

private let kNameEthereum:  String = "Ethereum"
private let kSlugEthereum:  String = "ethereum"
private let kNameToncoin:   String = "Toncoin"
private let kSlugToncoin:   String = "toncoin"

public enum Blockchain: String, CaseIterable, Codable {
    
    // MARK: - Cases
    
    case Multi
    case Ethereum
    case Toncoin
    
}

extension Blockchain {
    
    public enum Token: String, CaseIterable, Codable {
        case ETH, TON
        
        public var name: String {
            switch self {
            case .TON:
                return kNameToncoin
            case .ETH:
                return kNameEthereum
            }
        }
        
        public var slug: String {
            switch self {
            case .TON:
                return kSlugToncoin
            case .ETH:
                return kSlugEthereum
            }
        }
        
        public var blockchain: Blockchain {
            switch self {
            case .TON:
                return .Toncoin
            case .ETH:
                return .Ethereum
            }
        }
    }
    
}

extension Blockchain {
    static public let scheme: String = "blockchain_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "blockchain")
    
}

extension Blockchain.Token {
    static public let scheme: String = "blockchain_token_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "blockchain_token")
}

extension Blockchain {
    
    public enum App {
        case p2p, wallets
    }
    
    /// Доступные токены
    public static func availableTokens(_ app: App) -> [Blockchain.Token] {
        [.ETH, .TON]
    }
    
}
