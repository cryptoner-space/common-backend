//
//  IntegrationAccountDto.swift
//  
//
//  Created by skibinalexander on 29.06.2022.
//

import Vapor

extension Blockchains_Dto {
    
    public struct Account {
        
        public struct Create {
            
            public struct Res: Content {
                
                /// Публичный ключ
                public let publicKey: String
                
                /// Приватный ключ
                public let privateKey: String
                
                /// Mnemonic фраза восстановления пароля
                public let mnemonic: [String]?
                
                // MARK: - Init
                
                public init(
                    publicKey: String,
                    privateKey: String,
                    mnemonic: [String]?
                ) {
                    self.publicKey = publicKey
                    self.privateKey = privateKey
                    self.mnemonic = mnemonic
                }
                
            }
            
        }
        
        public struct Restore {
            
            public struct Req: Content {
                
                /// Приватный ключ
                public let privateKey: String?
                
                /// Мнемоника восстановления
                public let mnemonic: [String]?
                
                // MARK: - Init
                
                public init(
                    privateKey: String?,
                    mnemonic: [String]?
                ) {
                    self.privateKey = privateKey
                    self.mnemonic = mnemonic
                }
                
            }
            
            public struct Res: Content {
                
                /// Публичный ключ
                public let publicKey: String
                
                /// Приватный ключ
                public let privateKey: String
                
                /// Mnemonic фраза восстановления пароля
                public let mnemonic: [String]?
                
                // MARK: - Init
                
                public init(
                    publicKey: String,
                    privateKey: String,
                    mnemonic: [String]?
                ) {
                    self.publicKey = publicKey
                    self.privateKey = privateKey
                    self.mnemonic = mnemonic
                }
                
            }
            
        }
        
    }
    
}
