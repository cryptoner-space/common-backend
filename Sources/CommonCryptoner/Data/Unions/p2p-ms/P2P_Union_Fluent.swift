//
//  FiatPaymentType.swift
//  
//
//  Created by skibinalexander on 08.01.2023.
//

import Vapor
import Fluent
import CommonCryptonerData

// MARK: - FiatPaymentType

extension P2P_Union.FiatPaymentType {
    static public let schema: String = "p2p_fiat_payment_type"
    static public let relation: FieldKey = .init(stringLiteral: "fiat_payment_type")
    
    public struct Migration_v001: Migration {
        public init() {}
        
        public func prepare(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(P2P_Union.FiatPaymentType.schema)
                .case(P2P_Union.FiatPaymentType.SBP.rawValue)
                .case(P2P_Union.FiatPaymentType.MIR.rawValue)
                .case(P2P_Union.FiatPaymentType.MASTERCARD.rawValue)
                .case(P2P_Union.FiatPaymentType.VISA.rawValue)
                .case(P2P_Union.OrderType.SALE.rawValue)
                .create()
                .transform(to: ())
        }

        public func revert(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(P2P_Union.FiatPaymentType.schema)
                .delete()
        }
    }
}

// MARK: - OrderType

extension P2P_Union.OrderType {
    static public let schema: String = "p2p_order_type"
    static public let relation: FieldKey = .init(stringLiteral: "order_type")
    
    public struct Migration_v001: Migration {
        public init() {}
        
        public func prepare(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(P2P_Union.OrderType.schema)
                .case(P2P_Union.OrderType.BUY.rawValue)
                .case(P2P_Union.OrderType.SALE.rawValue)
                .create()
                .transform(to: ())
        }

        public func revert(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(P2P_Union.OrderType.schema)
                .delete()
        }
    }
}

// MARK: - RegionType

extension P2P_Union.RegionType {
    static public let schema: String = "p2p_region_type"
    static public let relation: FieldKey = .init(stringLiteral: "region_type")
    
    public struct Migration_v001: Migration {
        public init() {}
        
        public func prepare(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(P2P_Union.RegionType.schema)
                .case(P2P_Union.RegionType.RU.rawValue)
                .case(P2P_Union.RegionType.UA.rawValue)
                .case(P2P_Union.RegionType.KZ.rawValue)
                .create()
                .transform(to: ())
        }

        public func revert(on database: Database) -> EventLoopFuture<Void> {
            database
                .enum(P2P_Union.RegionType.schema)
                .delete()
        }
    }
}
