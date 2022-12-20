//
//  P2P_Union+BuyOrderStatus.swift
//  
//
//  Created by skibinalexander on 06.12.2022.
//

import Vapor
import Fluent

extension P2P_Union {

    /// Статус предложения к заявке P2P
    public enum ProposalOrderStatusEnum: String, Codable {
        
        // MARK: - Cases
        
        /// Пользователь создал заявку на покупку / продажу
        case CREATED
        
        /// Пользователь отменил заявку на покупку / продажу
        case CANCELED
        
        /// Пользователь подтвердил готовность выполнения заявки
        case ACCEPTED
        
        /// Пользователь отклонил готовность выполнения заявки
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

extension P2P_Union.ProposalOrderStatusEnum {
    
    // MARK: - Scheme
    
    static public let scheme: String = "proposal_order_status_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "status")
    
}
