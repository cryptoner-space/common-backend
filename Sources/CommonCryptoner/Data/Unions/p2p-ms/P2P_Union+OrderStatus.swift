//
//  CBS_Union+OrderStatus.swift
//
//
//  Created by skibinalexander on 30.11.2022.
//

import Vapor
import Fluent

extension P2P_Union {
    
    /// Статус операций сервиса CBS
    public enum OrderStatusEnum: String, CaseIterable, Codable {
        
        // MARK: - Cases
        
        case CREATED, PENDING, COMPLETED, FAILED, CANCELED
        
    }
    
}

extension P2P_Union.OrderStatusEnum {
    static public let scheme: String = "order_status_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "status")
}
