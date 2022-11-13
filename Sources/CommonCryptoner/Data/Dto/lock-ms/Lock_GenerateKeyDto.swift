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
            let password: String
            
        }
        
        public struct YC: Content {
            
            public struct Req: Content {
                
                /// Версия ключа
                let versionId: String
                
                /// Авторизационные данные шифрования
                let aadContext: String
                
                /// Алгоритм шифрования
                let dataKeySpec: String
                
                /// Отображения ответа шифра в формате plaintext
                let skipPlaintext: Bool
                
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
                let keyId: String
                
                /// Версия ключа
                let versionId: String
                
                /// PlainText ключ DEK
                let dataKeyPlaintext: String
                
                /// Шифрованный ключ DEK
                let dataKeyCiphertext: String
                
                // MARK: - Init
                
                public init(
                    keyId: String,
                    versionId: String,
                    dataKeyPlaintext: String,
                    dataKeyCiphertext: String
                ) {
                    self.keyId = keyId
                    self.versionId = versionId
                    self.dataKeyPlaintext = dataKeyPlaintext
                    self.dataKeyCiphertext = dataKeyCiphertext
                }
                
            }
            
        }
        
    }
    
}
