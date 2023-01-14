//
//  P2P_Dto+FiatPayment.swift
//  
//
//  Created by skibinalexander on 08.01.2023.
//

import Vapor

extension P2P_Dto {
    
    public struct FiatPayment {
        
        public struct Req: Content {
            
            /// Тип фиатной оплаты
            public let paymentType: P2P_Union.FiatPaymentTypeEnum
            
            /// Регион проведения оплаты
            public let regionType: P2P_Union.RegionTypeEnum
            
            /// Телефон
            public let phone: String?
            
            /// Номер счета
            public let account: String?
            
            /// Номер карты
            public let card: String?
            
            /// Описание
            public let description: String?
            
            // MARK: - Init
            
            public init(
                paymentType: P2P_Union.FiatPaymentTypeEnum,
                regionType: P2P_Union.RegionTypeEnum,
                phone: String?,
                account: String?,
                card: String?,
                description: String?
            ) {
                self.paymentType = paymentType
                self.regionType = regionType
                self.phone = phone
                self.account = account
                self.card = card
                self.description = description
            }
            
        }
        
        public struct Res: Content {
            
            /// Идентфикатор
            public let id: UUID
            
            /// Тип фиатной оплаты
            public let paymentType: P2P_Union.FiatPaymentTypeEnum
            
            /// Регион проведения оплаты
            public let regionType: P2P_Union.RegionTypeEnum
            
            /// Изображение способа оплаты
            public let iconUrl: String?
            
            /// Телефон
            public let phone: String?
            
            /// Номер счета
            public let account: String?
            
            /// Номер карты
            public let card: String?
            
            /// Описание
            public let description: String?
            
            // MARK: - Init
            
            public init(
                id: UUID,
                paymentType: P2P_Union.FiatPaymentTypeEnum,
                regionType: P2P_Union.RegionTypeEnum,
                iconUrl: String? = nil,
                phone: String? = nil,
                account: String? = nil,
                card: String? = nil,
                description: String? = nil
            ) {
                self.id = id
                self.paymentType = paymentType
                self.regionType = regionType
                self.iconUrl = iconUrl
                self.phone = phone
                self.account = account
                self.card = card
                self.description = description
            }
            
        }
        
    }
    
}
