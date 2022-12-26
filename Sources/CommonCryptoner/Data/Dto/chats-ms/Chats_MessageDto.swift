//
//  ChatMessageOutcomeDto.swift
//  
//
//  Created by Скибин Александр on 17.05.2022.
//

import Vapor

extension Chats_Dto {
    
    public struct Message {
        
        public struct Req: Content {
            
            /// Идентификатор пространства
            public let spaceId: UUID
            
            /// Base64 данные сообщения
            public let data: String
            
            // MARK: - Init
            
            public init(spaceId: UUID, data: String) {
                self.spaceId = spaceId
                self.data = data
            }
            
        }
        
        public struct Res: Content {
            
            /// Идентификатор чата
            public let id: UUID
            
            /// Дата создания сообщения
            public let createdAt: Date?
            
            /// Дата обновления сообщения
            public let updatedAt: Date?
            
            /// Заголовок чата
            public let data: Data
            
            /// Отправитель сообщения
            public let userId: String
            
            // MARK: - Init
            
            public init(
                id: UUID,
                createdAt: Date?,
                updatedAt: Date?,
                data: Data,
                userId: String
            ) {
                self.id = id
                self.createdAt = createdAt
                self.updatedAt = updatedAt
                self.data = data
                self.userId = userId
            }
            
        }
        
        public struct List {
            
            /// Модель входящей пагинации
            public struct Req: Content {
                
                /// Идентификатор пользователя
                public let userId: String
                
                /// Идентификатор пространства чата
                public let spaceId: UUID
                
                /// Смещение по списку
                public let offset: Int
                
                /// Количиство выдачи
                public let limit: Int
                
                // MARK: - Init
                
                public init(
                    userId: String,
                    spaceId: UUID,
                    offset: Int,
                    limit: Int
                ) {
                    self.userId = userId
                    self.spaceId = spaceId
                    self.offset = offset
                    self.limit = limit
                }
                
            }
            
        }
        
    }
    
}
