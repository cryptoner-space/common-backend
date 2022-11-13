//
//  OpenChatSpaceOutcomeDto.swift
//  
//
//  Created by Скибин Александр on 17.05.2022.
//

import Vapor

extension Chats_Dto {
    
    public struct Space {
        
        public struct Req: Content {
            
            /// Идентификатор пространства чата
            public let id: UUID
            
            /// Заголовок чата
            public let title: String?
            
            /// Владелец пространства
            public let ownerId: UUID
            
            /// Участники пространства чата
            public let membersId: [UUID]
            
            // MARK: - Init
            
            public init(
                id: UUID,
                title: String?,
                ownerId: UUID,
                membersId: [UUID]
            ) {
                self.id = id
                self.title = title
                self.ownerId = ownerId
                self.membersId = membersId
                
            }
            
        }
        
        public struct Open {
            
            public struct Res: Content {
                
                /// Идентификатор пространства чата
                public let id: UUID
                
                /// Заголовок чата
                public let title: String?
                
                /// Владелец пространства
                public let ownerId: UUID
                
                /// Участники пространства чата
                public let membersId: [UUID]
                
                // MARK: - Init
                
                public init(id: UUID, title: String?, ownerId: UUID, membersId: [UUID]) {
                    self.id = id
                    self.title = title
                    self.ownerId = ownerId
                    self.membersId = membersId
                }
                
            }
            
        }
        
        public struct List {
            
            public struct Res: Content {
                
                /// Идентификатор чата
                public let id: UUID
                
                /// Заголовок чата
                public let title: String?
                
                /// Описание чата (Последнее сообщение / Мета информация)
                public let description: String?
                
                /// Дата последней активности пространства чата
                public let date: Date?
                
                /// Тип пространства чата
                public let type: UserSpaceType
                
                /// Роль в пространстве чата
                public let role: UserSpaceRole
                
                // MARK: - Init
                
                public init(
                    id: UUID,
                    title: String?,
                    description: String?,
                    date: Date?,
                    type: UserSpaceType,
                    role: UserSpaceRole
                ) {
                    self.id = id
                    self.title = title
                    self.description = description
                    self.date = date
                    self.type = type
                    self.role = role
                }
                
            }
            
        }
        
        public struct Accept {
            
            public struct Req: Content {
                
                /// Идентификатор чата
                public let spaceId: UUID
                
                /// Идентификатор пользоватедя
                public let userId: UUID
                
                // MARK: - Init
                
                public init(spaceId: UUID, userId: UUID) {
                    self.spaceId = spaceId
                    self.userId = userId
                }
                
            }
            
        }
        
    }
    
}
