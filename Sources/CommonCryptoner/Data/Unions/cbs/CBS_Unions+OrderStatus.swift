//
//  CBS_Dto+OrderStatus.swift
//  
//
//  Created by skibinalexander on 30.11.2022.
//

import Vapor
import Fluent

extension CBS_Dto {
    
    /// Статус операций сервиса CBS
    public enum OrderStatusEnum: String, CaseIterable, Codable {
        
        // MARK: - Cases
        
        /// Создан
        case created
        
        /// Подтвержден отправителем
        case pending
        
        /// Авторизован получателем
        case authorized
        
        /// Завершение операции
        case completed
        
        /// Отменена
        case canceled
        
        /// Завершена с ошибкой
        case failed
        
    }
    
}

extension CBS_Dto.OrderStatusEnum {
    static public let scheme: String = "cbs_order_status_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "status")
}
