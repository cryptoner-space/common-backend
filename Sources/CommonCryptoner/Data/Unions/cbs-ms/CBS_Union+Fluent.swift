//
//  CBS_Union+Fluent.swift
//  
//
//  Created by skibinalexander on 30.11.2022.
//

import Vapor
import Fluent
import CommonCryptonerData

extension CBS_Union.OrderType {
    static public let schema: String = "cbs_order_type"
    static public let relation: FieldKey = .init(stringLiteral: "order_type")
    
    public struct Migration_v001: Migration {
        
        public init() {}
        
        public func prepare(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(CBS_Union.OrderType.schema)
                .case(CBS_Union.OrderType.DEPOSIT.rawValue)
                .case(CBS_Union.OrderType.WITHDRAW.rawValue)
                .create()
                .transform(to: ())
        }

        public func revert(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(CBS_Union.OrderType.schema)
                .delete()
        }
        
    }

}

extension CBS_Union.DepositoryLedgerType {
    static public let schema = "cbs_depositoty_leger_type"
    static public let relation: FieldKey = .init(stringLiteral: "ledger_type")
    
    public struct Migration_v001: Migration {
        
        public init() {}
        
        public func prepare(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(CBS_Union.DepositoryLedgerType.schema)
                .case(CBS_Union.DepositoryLedgerType.DEPOSIT.rawValue)
                .case(CBS_Union.DepositoryLedgerType.WITHDRAW.rawValue)
                .create()
                .transform(to: ())
        }

        public func revert(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(CBS_Union.DepositoryLedgerType.schema)
                .delete()
        }
        
    }
}
