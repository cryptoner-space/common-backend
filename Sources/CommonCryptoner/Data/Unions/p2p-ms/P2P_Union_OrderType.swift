//
//  P2P_Union_OrderType.swift
//  
//
//  Created by skibinalexander on 20.12.2022.
//

import Vapor
import Fluent

extension P2P_Union {
    
    /// Тип заявки сервиса P2P
    public enum OrderTypeEnum: String, CaseIterable, Codable {
        
        // MARK: - Cases
        
        /// Продажа
        case SALE
        
        /// Покупка
        case BUY
        
    }
    
}

extension P2P_Union.OrderTypeEnum {
    static public let scheme: String = "p2p_order_type_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "type")
}
