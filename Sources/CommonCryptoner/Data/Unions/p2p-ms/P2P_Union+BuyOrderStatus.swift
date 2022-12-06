//
//  P2P_Union+BuyOrderStatus.swift
//  
//
//  Created by skibinalexander on 06.12.2022.
//

import Vapor
import Fluent

extension P2P_Union {

    /// Статус танзакции криптовалюты
    public enum BuyOrderStatusEnum: String, Codable {
        
        // MARK: - Cases
        
        /// Пользователь (покупатель) создал заявку на покупку
        case CREATED
        
        /// Пользователь (покупатель) отменил заявку на покупку
        case CANCELED
        
        /// Пользователь (продавец) подтвердил готовность выполнения заявки
        case ACCEPTED
        
        /// Пользователь (продавец) отклонил готовность выполнения заявки
        case DECLINED
        
        /// Заявка готова к исполнению
        case READY_EXECUTED
        
        /// Заявка в исполнении
        case EXECUTED
        
        /// Оценка выполнения заявки
        case REVIEWED
        
        /// Заявка выполнена
        case COMPLETED
        
        /// Заявка завершена с ошибкой
        case FAILED
        
    }
    
}

extension P2P_Union.BuyOrderStatusEnum {
    
    // MARK: - Scheme
    
    static public let scheme: String = "buy_sale_order_status_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "status")
    
}
