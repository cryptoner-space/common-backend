//
//  Swap_Union.MetaType.swift
//  
//
//  Created by skibinalexander on 17.05.2023.
//

import Foundation
import Vapor
import Fluent
import CommonCryptonerData

extension Swap_Union.MetaType {
    public static let scheme: String = "swap_order_meta_type"
    public static let relation: FieldKey = .init(stringLiteral: "meta_type")
}

extension Swap_Union.MetaType {
    
    public struct Migration_v001: Migration {
        
        public init() {}
        
        public func prepare(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(Swap_Union.MetaType.scheme)
                .case(Swap_Union.MetaType.BUY.rawValue)
                .case(Swap_Union.MetaType.SALE.rawValue)
                .create()
                .transform(to: ())
        }

        public func revert(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(Swap_Union.MetaType.scheme)
                .delete()
        }
        
    }
    
}
