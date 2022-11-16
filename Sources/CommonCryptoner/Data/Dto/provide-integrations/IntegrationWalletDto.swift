//
//  IntegrationWalletDto.swift
//  
//
//  Created by skibinalexander on 28.07.2022.
//

import Vapor

public struct IntegrationWalletDto {
    
    public struct Req: Content {
        
        /// Публичный ключ
        let publicKey: String
        
        /// Приватный ключ
        let privateKey: String
        
    }
    
    public struct Res: Content {
        
        /// Адрес кошелька
        let address: String
        
    }
    
}
