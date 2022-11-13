//
//  Lock_GenerateKeyDto.swift
//  
//
//  Created by skibinalexander on 13.11.2022.
//

import Vapor

extension Lock_Dto {
    
    public struct DEK {
        
        public struct Req: Content {
            
            /// Пароль пользователя для шифрования
            public let password: String
            
        }
        
        public struct Res: Content {
            
            /// PlainText ключ DEK
            public let dataKeyPlaintext: String
            
            /// Шифрованный ключ DEK
            public let dataKeyCiphertext: String
            
        }
        
        public struct YC: Content {
            
            public struct Req: Content {
                
                /// Версия ключа
                public let versionId: String
                
                /// Авторизационные данные шифрования
                public let aadContext: String
                
                /// Алгоритм шифрования
                public let dataKeySpec: String
                
                /// Отображения ответа шифра в формате plaintext
                public let skipPlaintext: Bool
                
                // MARK: - Init
                
                public init(
                    versionId: String,
                    aadContext: String,
                    dataKeySpec: String,
                    skipPlaintext: Bool
                ) {
                    self.versionId = versionId
                    self.aadContext = aadContext
                    self.dataKeySpec = dataKeySpec
                    self.skipPlaintext = skipPlaintext
                }
                
            }
            
            public struct Res: Content {
                
                /// Идентификатор ключа
                public let keyId: String
                
                /// Версия ключа
                public let versionId: String
                
                /// PlainText ключ DEK
                public let dataKeyPlaintext: String
                
                /// Шифрованный ключ DEK
                public let dataKeyCiphertext: String
                
            }
            
        }
        
    }
    
}
