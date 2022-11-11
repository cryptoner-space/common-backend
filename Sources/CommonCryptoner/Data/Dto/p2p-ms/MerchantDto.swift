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
        let userId: String
        
        /// Название мерчата
        let merchantName: String
        
    }
    
    public struct Res: Content {
        
        /// Идентификатор мерчанта
        let id: UUID
        
        /// Идентификатор пользователя мерчанта
        let userId: String
        
        /// Наименование мерчанта
        let merchantName: String
        
    }
    
}
