//
//  FiatPaymentType.swift
//  
//
//  Created by skibinalexander on 08.01.2023.
//

import Vapor
import Fluent

extension P2P_Union {
    
    /// Способы получения платежа
    public enum FiatPaymentTypeEnum: String, CaseIterable, Codable {
        
        // MARK: - Cases
        
        case SBP, Tinkoff, Sberbank, VTB, YooMoney, Payeer, QIWI
        
    }
    
}

extension P2P_Union.FiatPaymentTypeEnum {
    static public let scheme: String = "p2p_fiat_payment_type_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "type")
}
