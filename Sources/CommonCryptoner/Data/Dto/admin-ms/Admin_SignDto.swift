//
//  Admin_SignDto.swift
//  
//
//  Created by skibinalexander on 15.11.2022.
//

import Vapor

extension Admin_Dto {
    
    public struct Sign {
        
        public struct InReq: Content {
            
            /// Идентификатор девайса
            public let deviceId: UUID
            
            /// Username  пользователя
            public let username: String
            
            /// Пароль  пользователя
            public let password: String
            
        }
        
        public struct UpReq: Content {
            
            /// Идентификатор системы владения пользователем
            public let systemId: String
            
            /// Идентификатор девайса
            public let deviceId: UUID
            
            /// Username пользователя
            public let username: String
            
            /// Пароль аккаунта
            public let password: String
            
        }
        
        public struct Res: Content {
            
            /// Идентификатор девайса
            public let deviceId: UUID
            
            /// Токен авторизации
            public let accessToken: String
            
            /// Модель пользователя
            public let user: User.Res
            
            // MARK: - Init
            
            public init(
                deviceId: UUID,
                accessToken: String,
                user: User.Res
            ) {
                self.deviceId = deviceId
                self.accessToken = accessToken
                self.user = user
            }
            
        }
        
    }
    
}
