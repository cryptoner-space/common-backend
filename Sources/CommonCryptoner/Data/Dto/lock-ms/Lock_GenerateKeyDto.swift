//
//  Lock_GenerateKeyDto.swift
//  
//
//  Created by skibinalexander on 13.11.2022.
//

import Vapor

extension Lock_Dto {
    
    public struct GenerateKey {
        
        public struct Req: Content {
            
            /// Версия ключа
            let versionId: String
            
            /// Авторизационные данные шифрования
            let aadContext: String
            
            /// Алгоритм шифрования
            let dataKeySpec: String
            
            /// Отображения ответа шифра в формате plaintext
            let skipPlaintext: Bool
            
        }
        
        
    }
    
}
