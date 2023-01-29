//
//  CBS_Union+Fluent.swift
//  
//
//  Created by skibinalexander on 30.11.2022.
//

import Vapor
import Fluent
import CommonCryptonerData

extension CBS_Union.OrderTypeEnum {
    static public let scheme: String = "cbs_order_type_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "type")
}

extension CBS_Union.OrderStatusEnum {
    static public let scheme: String = "cbs_order_status_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "status")
}
