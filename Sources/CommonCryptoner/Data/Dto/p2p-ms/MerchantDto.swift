//
//  MerchantDto.swift
//  
//
//  Created by skibinalexander on 01.11.2022.
//

import Vapor

public struct MerchantDto {
    
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
        
        // MARK: - Init
        
        public init(
            id: UUID,
            userId: String,
            merchantName: String
        ) {
            self.id = id
            self.userId = userId
            self.merchantName = merchantName
        }
        
    }
    
}
