//
//  IntegrationAccountDto.swift
//  
//
//  Created by skibinalexander on 29.06.2022.
//

import Vapor

public struct IntegrationAccountDto {
    
    public struct Create {
        
        public struct Res: Content {
            
            /// Публичный ключ
            let publicKey: String
            
            /// Приватный ключ
            let privateKey: String
            
            /// Mnemonic фраза восстановления пароля
            let mnemonic: [String]?
            
        }
        
    }
    
    public struct Restore {
        
        public struct Req: Content {
            
            /// Приватный ключ
            let privateKey: String?
            
            /// Мнемоника восстановления
            let mnemonic: [String]?
            
        }
        
        public struct Res: Content {
            
            /// Публичный ключ
            let publicKey: String
            
            /// Приватный ключ
            let privateKey: String
            
            /// Mnemonic фраза восстановления пароля
            let mnemonic: [String]?
            
        }
        
    }
    
}
