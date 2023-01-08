//
//  P2P_Dto+FiatPayment.swift
//  
//
//  Created by skibinalexander on 08.01.2023.
//

import Vapor

extension P2P_Dto {
    
    public struct FiatPayment: Content {
        
        public struct Res: Content {
            
            /// Идентфикатор
            public let id: UUID
            
            /// Тип фиатной оплаты
            public let paymentType: P2P_Union.FiatPaymentTypeEnum
            
            /// Регион проведения оплаты
            public let regionType: P2P_Union.RegionTypeEnum
            
            // MARK: - Init
            
            public init(
                id: UUID,
                paymentType: P2P_Union.FiatPaymentTypeEnum,
                regionType: P2P_Union.RegionTypeEnum
            ) {
                self.id = id
                self.paymentType = paymentType
                self.regionType = regionType
            }
            
        }
        
    }
    
}
