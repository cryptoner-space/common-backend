//
//  AccountDto.swift
//  
//
//  Created by skibinalexander on 12.11.2022.
//

import Vapor

extension CBS_Dto {
    
    public struct AccountDto {
        
        public struct Req: Content {
            
            /// Идентификатор пользователя
            public let userId: String
            
        }
        
    }
    
}
