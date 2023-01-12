//
//  MerchantDto.swift
//  
//
//  Created by skibinalexander on 01.11.2022.
//

import Vapor

extension P2P_Dto {
    
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
            
            /// Изображение мерчанта
            public let imageUrl: String?
            
            /// Велком сообщение мерчанта
            public let message: String?
            
            /// Рейтинг
            public let raiting: Float
            
            /// Выполняемость заказов
            public let advance: Float
            
            /// Способы приема плетежей
            public let payments: [FiatPayment.Res]
            
            // MARK: - Init
            
            public init(
                id: UUID,
                userId: String,
                merchantName: String,
                imageUrl: String?,
                message: String?,
                raiting: Float,
                advance: Float,
                payments: [FiatPayment.Res]
            ) {
                self.id = id
                self.userId = userId
                self.merchantName = merchantName
                self.imageUrl = imageUrl
                self.message = message
                self.raiting = raiting
                self.advance = advance
                self.payments = payments
            }
            
        }
        
    }

    
}
