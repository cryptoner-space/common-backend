//
//  MerchantDto.swift
//  
//
//  Created by skibinalexander on 01.11.2022.
//

import Vapor

extension P2P_Dto {
    
    public struct FiatPayment: Content {
        
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
    
    public struct Info: Content {
        
        /// Идентификатор
        public let id: UUID
        
        /// Рейтинг
        public let raiting: Float
        
        /// Выполняемость заказов
        public let advance: Float
        
        ///
        public let payments: [FiatPayment]
        
        // MARK: - Init
        
        public init(
            id: UUID,
            raiting: Float,
            advance: Float,
            payments: [FiatPayment]
        ) {
            self.id = id
            self.raiting = raiting
            self.advance = advance
            self.payments = payments
        }
        
    }
    
    public struct Merchant {
        
        public struct Req: Content {
            
            /// Идентификатор пользователя
            public let userId: String
            
            /// Название мерчата
            public let merchantName: String
            
            // MARK: - Init
            
            public init(
                userId: String,
                merchantName: String
            ) {
                self.userId = userId
                self.merchantName = merchantName
            }
            
        }
        
        public struct Res: Content {
            
            /// Идентификатор мерчанта
            public let id: UUID
            
            /// Идентификатор пользователя мерчанта
            public let userId: String
            
            /// Наименование мерчанта
            public let merchantName: String
            
            /// Информация мерчанта
            public let info: Info
            
            // MARK: - Init
            
            public init(
                id: UUID,
                userId: String,
                merchantName: String,
                info: Info
            ) {
                self.id = id
                self.userId = userId
                self.merchantName = merchantName
                self.info = info
            }
            
        }
        
    }

    
}
