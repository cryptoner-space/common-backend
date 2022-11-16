//
//  AccountEnum.swift
//  
//
//  Created by skibinalexander on 16.11.2022.
//

import Vapor
import Fluent

public enum AccountEnum: String, CaseIterable, Codable {
    
    // MARK: - Cases
    
    case Virtual
    case Blockchain
    
}

extension AccountEnum {
    static public let scheme: String = "account_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "account")
    
}
