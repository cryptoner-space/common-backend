//
//  CAS_Union.swift
//  
//
//  Created by skibinalexander on 06.12.2022.
//

import Vapor
import Fluent
import CommonCryptonerData

extension CAS_Union.WalletType {
    static public let scheme: String = "wallet_type_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "wallet_type")
}

extension CAS_Union.WalletLayout {
    static public let scheme: String = "wallet_layout_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "wallet_layout")
}
