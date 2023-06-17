//
//  FiatPaymentType.swift
//  
//
//  Created by skibinalexander on 08.01.2023.
//

import CommonCryptonerData
import Vapor
import Fluent

extension P2P_Union.FiatPaymentTypeEnum {
    static public let scheme: String = "p2p_fiat_payment_type_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "fiat_payment_type")
}

extension P2P_Union.OrderTypeEnum {
    static public let scheme: String = "p2p_order_type_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "order_type")
}

extension P2P_Union.RegionType {
    static public let scheme: String = "p2p_region_type_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "region_type")
}
