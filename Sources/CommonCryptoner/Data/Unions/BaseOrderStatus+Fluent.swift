//
//  BaseOrderStatus+Fluent.swift
//  
//
//  Created by skibinalexander on 17.05.2023.
//

import Fluent
import CommonCryptonerData

extension BaseOrderStatus {
    static let scheme: String = "base_order_status"
    static let relation: FieldKey = .init(stringLiteral: "status")
}

struct BaseOrderStatusMigration_v001: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database
            .enum(BaseOrderStatus.scheme)
            .case(BaseOrderStatus.created.rawValue)
            .case(BaseOrderStatus.approved.rawValue)
            .case(BaseOrderStatus.cancelled.rawValue)
            .case(BaseOrderStatus.completed.rawValue)
            .case(BaseOrderStatus.error.rawValue)
            .case(BaseOrderStatus.fulfilled.rawValue)
            .case(BaseOrderStatus.inProgress.rawValue)
            .case(BaseOrderStatus.installing.rawValue)
            .case(BaseOrderStatus.pending.rawValue)
            .case(BaseOrderStatus.preparing.rawValue)
            .case(BaseOrderStatus.processing.rawValue)
            .case(BaseOrderStatus.received.rawValue)
            .create()
            .transform(to: ())
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database
            .enum(BaseOrderStatus.scheme)
            .delete()
    }
    
}
