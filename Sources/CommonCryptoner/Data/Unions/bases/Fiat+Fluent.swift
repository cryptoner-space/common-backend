//
//  Fiat+Fluent.swift
//  
//
//  Created by skibinalexander on 18.06.2023.
//

import Fluent
import CommonCryptonerData

extension FiatEnum {
    public static let schema: String = "fiat"
    public static let relation: FieldKey = .init(stringLiteral: "fiat")
}
