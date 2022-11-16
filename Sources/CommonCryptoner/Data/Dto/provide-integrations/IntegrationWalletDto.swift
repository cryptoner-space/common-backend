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
        public let publicKey: String
        
        /// Приватный ключ
        public let privateKey: String
        
        // MARK: - Init
        
        public init(
            publicKey: String,
            privateKey: String
        ) {
            self.publicKey = publicKey
            self.privateKey = privateKey
        }
        
    }
    
    public struct Res: Content {
        
        /// Адрес кошелька
        public let address: String
        
        // MARK: - Init
        
        public init(
            address: String
        ) {
            self.address = address
        }
        
    }
    
}
