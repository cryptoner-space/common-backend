//
//  CBS_Union+OrderStatus.swift
//
//
//  Created by skibinalexander on 30.11.2022.
//

import Vapor
import Fluent

extension P2P_Union {
    
    /// Статус заявки P2P
    public enum OrderStatusEnum: String, CaseIterable, Codable {
        
        // MARK: - Cases
        
        /// Создана
        case CREATED
        
        /// Подтверждена
        case PENDING
        
        /// Авторизована
        case AUTHORIZED
        
        /// Успешно завершена
        case COMPLETED
        
        /// Завершена с ошибкой
        case FAILED
        
        /// Отменена
        case CANCELED
        
    }
    
}

extension P2P_Union.OrderStatusEnum {
    static public let scheme: String = "order_status_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "order_status")
}
