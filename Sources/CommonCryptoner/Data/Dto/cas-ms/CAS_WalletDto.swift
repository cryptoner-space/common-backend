//
//  CAS_WalletDto.swift
//  
//
//  Created by skibinalexander on 16.11.2022.
//

import Vapor

extension CAS_Dto {
    
    public struct Wallet {
        
        public struct Res: Content {
            
            /// Идентификатор
            public let id: UUID
            
            /// Дата создания
            public let createdAt: Date?
            
            /// Дата обновления
            public let updatedAt: Date?
            
            /// Заголовок кошелька
            public let title: String?
            
            /// Публичный адрес кошелька
            public let address: String
            
            /// Блокчейн кошелька
            public let blockchain: Blockchain
            
            /// Токены кошелька
            public let items: [WalletItem.Res]
            
            // MARK: - Init
            
            public init(
                id: UUID,
                createdAt: Date?,
                updatedAt: Date?,
                title: String?,
                address: String,
                blockchain: Blockchain,
                items: [WalletItem.Res]
            ) {
                self.id = id
                self.createdAt = createdAt
                self.updatedAt = updatedAt
                self.title = title
                self.address = address
                self.blockchain = blockchain
                self.items = items
            }
            
        }
        
        public struct Create {
            
            public struct Req: Content {
                
                /// Идентификатор счета пользователя
                public let accountId: UUID
                
                /// Блокчаин кошелька
                public let blockchain: Blockchain
                
                /// Заголовок кошелька
                public let title: String?
                
                // MARK: - Init
                
                public init(
                    accountId: UUID,
                    blockchain: Blockchain,
                    title: String?
                ) {
                    self.accountId = accountId
                    self.blockchain = blockchain
                    self.title = title
                }
                
            }
            
            public struct Res: Content {
                
                /// Публичный адрес кошелька
                public let address: String
                
                /// Публичный ключ
                public let publicKey: String?
                
                /// Серкретный ключ
                public let privateKey: String?
                
                /// Мнемоника восстановления кошелька
                public let mnemonic: [String]?
                
                // MARK: - Init
                
                public init(
                    address: String,
                    publicKey: String?,
                    privateKey: String?,
                    mnemonic: [String]?
                ) {
                    self.address = address
                    self.publicKey = publicKey
                    self.privateKey = privateKey
                    self.mnemonic = mnemonic
                }
                
            }
            
        }
        
        public struct Restore {
            
            public struct Req: Content {
                
                /// Идентификатор счета пользователя
                public let accountId: UUID
                
                /// Блокчаин кошелька
                public let blockchain: Blockchain
                
                /// Заголовок кошелька
                public let title: String?
                
                /// Серкретный ключ
                public let privateKey: String?
                
                /// Мнемоника восстановления кошелька
                public let mnemonic: [String]?
                
                // MARK: - Init
                
                public init(
                    accountId: UUID,
                    blockchain: Blockchain,
                    title: String?,
                    privateKey: String?,
                    mnemonic: [String]?
                ) {
                    self.accountId = accountId
                    self.blockchain = blockchain
                    self.title = title
                    self.privateKey = privateKey
                    self.mnemonic = mnemonic
                }
                
            }
            
            public struct Res: Content {
                
                /// Публичный адрес кошелька
                public let address: String
                
                /// Публичный ключ
                public let publicKey: String?
                
                /// Серкретный ключ
                public let privateKey: String?
                
                /// Мнемоника восстановления кошелька
                public let mnemonic: [String]?
                
                // MARK: - Init
                
                public init(
                    address: String,
                    publicKey: String?,
                    privateKey: String?,
                    mnemonic: [String]?
                ) {
                    self.address = address
                    self.publicKey = publicKey
                    self.privateKey = privateKey
                    self.mnemonic = mnemonic
                }
                
            }
            
        }
        
        public struct Recovery {
                
            public struct Req: Content {
                
                /// Блокчнейн восстановление
                public let blockchain: Blockchain
                
                /// Серкретный ключ
                public let privateKey: String?
                
                /// Мнемоника восстановления кошелька
                public let mnemonic: [String]?
                
                // MARK: - Init
                
                public init(
                    blockchain: Blockchain,
                    privateKey: String?,
                    mnemonic: [String]?
                ) {
                    self.blockchain = blockchain
                    self.privateKey = privateKey
                    self.mnemonic = mnemonic
                }
                
            }
            
            public struct Res: Content {
                
                /// Публичный адрес кошелька
                public let address: String
                
                /// Публичный ключ
                public let publicKey: String?
                
                /// Серкретный ключ
                public let privateKey: String?
                
                /// Мнемоника восстановления кошелька
                public let mnemonic: [String]?
                
                // MARK: - Init
                
                public init(
                    address: String,
                    publicKey: String?,
                    privateKey: String?,
                    mnemonic: [String]?
                ) {
                    self.address = address
                    self.publicKey = publicKey
                    self.privateKey = privateKey
                    self.mnemonic = mnemonic
                }
                
            }
            
        }
        
    }
    
}
