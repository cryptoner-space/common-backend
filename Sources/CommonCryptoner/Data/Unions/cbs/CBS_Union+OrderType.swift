//
//  CBS_Union+OrderType.swift
//  
//
//  Created by skibinalexander on 30.11.2022.
//

import Vapor
import Fluent

extension CBS_Union {
    
    /// Тип заявки сервиса CBS
    public enum OrderTypeEnum: String, CaseIterable, Codable {
        
        // MARK: - Cases
        
        /// Внести
        case income
        
        /// Вывести
        case outcome
        
    }
    
}

extension CBS_Union.OrderTypeEnum {
    static public let scheme: String = "cbs_order_type_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "type")
}
