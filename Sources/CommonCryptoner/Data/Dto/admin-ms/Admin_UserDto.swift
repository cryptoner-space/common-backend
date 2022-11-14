//
//  Admin_UserDto.swift
//  
//
//  Created by skibinalexander on 14.11.2022.
//

import Vapor

extension Admin_Dto {
    
    public struct User {
        
        public struct Req: Content {
            
            /// Ссылка на изображение пользователя
            public let photoUrl: String?
            
            /// Имя пользователя
            public let firstName: String?
            
            /// Отчество пользователя
            public let middleName: String?
            
            /// Фамилия пользователя
            public let lastName: String?
            
        }
        
        public struct Res: Content {
            
            /// Идентификатор пользователя
            public let id: UUID
            
            /// Логин пользователя
            public let username: String
            
            /// Фотография пользователя
            public let photoUrl: String?
            
            /// Имя
            public let firstName: String?
            
            /// Отчество
            public let middleName: String?
            
            /// Фамилия
            public let lastName: String?
            
            // MARK: - Init
            
            public init(
                id: UUID,
                username: String,
                photoUrl: String?,
                firstName: String?,
                middleName: String?,
                lastName: String?
            ) throws {
                self.id = id
                self.username = username
                self.photoUrl = photoUrl
                self.firstName = firstName
                self.middleName = middleName
                self.lastName = lastName
            }
            
        }
        
    }
    
}
