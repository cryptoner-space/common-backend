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
        
    }
    
    public struct Res: Content {
        
        /// Идентификатор мерчанта
        public let id: UUID
        
        /// Идентификатор пользователя мерчанта
        public let userId: String
        
        /// Наименование мерчанта
        public let merchantName: String
        
    }
    
}
