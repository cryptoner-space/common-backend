//
//  Chat_Union+Fluent.swift
//  
//
//  Created by skibinalexander on 26.12.2022.
//

import Vapor
import Fluent
import CommonCryptonerData

extension Chat_Union.UserSpaceRole {
    static public let scheme: String = "user_space_role_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "user_space_role")
}

extension Chat_Union.UserSpaceType {
    static public let scheme: String = "user_space_type_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "user_space_type")
}
