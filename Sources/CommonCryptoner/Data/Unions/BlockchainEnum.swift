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
    
    // MARK: - Cases
    
    case Multi
    case Ethereum
    case Toncoin
    
}

extension Blockchain {
    
    public enum Token: String, CaseIterable, Codable {
        case ETH, TON
        
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
    
    /// Доступные токены для
    public static var availableTokensP2P: [Blockchain.Token] {
        [.ETH, .TON]
    }
    
    public static var availableTokensWallets: [Blockchain.Token] {
        [.ETH, .TON]
    }
    
}
