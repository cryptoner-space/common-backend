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
            
            /// Бинарные данные
            public let data: Data
            
            // MARK: - Init
            
            public init(spaceId: UUID, data: Data) {
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
            public let userId: UUID
            
            // MARK: - Init
            
            public init(id: UUID, createdAt: Date?, updatedAt: Date?, data: Data, userId: UUID) {
                self.id = id
                self.createdAt = createdAt
                self.updatedAt = updatedAt
                self.data = data
                self.userId = userId
            }
            
        }
        
    }
    
}
