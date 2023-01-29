//
//  CAS_Union.swift
//  
//
//  Created by skibinalexander on 06.12.2022.
//

import CommonCryptonerData
import Vapor
import Fluent

extension CAS_Union.WalletType {
    static public let scheme: String = "wallet_type_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "wallet_type")
    
}
