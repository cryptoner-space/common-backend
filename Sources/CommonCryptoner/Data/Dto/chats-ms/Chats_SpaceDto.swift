//
//  OpenChatSpaceOutcomeDto.swift
//  
//
//  Created by Скибин Александр on 17.05.2022.
//

import Vapor

extension Chats_Dto {
    
    public struct Space {
        
        public struct Find {
            
            /// Модель входящей пагинации
            public struct Req: Content {
                
                /// Владалец чата
                public let ownerId: String
                
                /// Идентификатор пользователя
                public let participantsId: [String]
                
                // MARK: - Init
                
                public init(
                    ownerId: String,
                    participantsId: [String]
                ) {
                    self.ownerId = ownerId
                    self.participantsId = participantsId
                }
                
            }
            
        }
        
        public struct List {
            
            /// Модель входящей пагинации
            public struct Req: Content {
                
                /// Идентификатор пользователя
                public let userId: String
                
                /// Смещение по списку
                public let offset: Int
                
                /// Количиство выдачи
                public let limit: Int
                
                // MARK: - Init
                
                public init(
                    userId: String,
                    offset: Int,
                    limit: Int
                ) {
                    self.userId = userId
                    self.offset = offset
                    self.limit = limit
                }
                
            }
            
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
                public let type: Chat_Union.UserSpaceType
                
                /// Роль в пространстве чата
                public let role: Chat_Union.UserSpaceRole
                
                // MARK: - Init
                
                public init(
                    id: UUID,
                    title: String?,
                    description: String?,
                    date: Date?,
                    type: Chat_Union.UserSpaceType,
                    role: Chat_Union.UserSpaceRole
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
        
        public struct Create {
            
            public struct Req: Content {
                
                /// Заголовок пространства чата
                public let title: String?
                
                /// Описание пространства чата
                public let description: String?
                
                /// Владелец пространства
                public let ownerId: String
                
                /// Участники пространства чата
                public let membersId: [String]
                
                // MARK: - Init
                
                public init(
                    title: String?,
                    description: String?,
                    ownerId: String,
                    membersId: [String]
                ) {
                    self.title = title
                    self.description = description
                    self.ownerId = ownerId
                    self.membersId = membersId
                    
                }
                
            }
            
            public struct Res: Content {
                
                /// Идентификатор пространства чата
                public let id: UUID
                
                // MARK: - Init
                
                public init(id: UUID) {
                    self.id = id
                    
                }
                
            }
            
        }
        
        public struct Open {
            
            public struct Res: Content {
                
                /// Идентификатор пространства чата
                public let id: UUID
                
                /// Заголовок чата
                public let title: String?
                
                /// Владелец пространства
                public let ownerId: String
                
                /// Участники пространства чата
                public let membersId: [String]
                
                // MARK: - Init
                
                public init(
                    id: UUID,
                    title: String?,
                    ownerId: String,
                    membersId: [String]
                ) {
                    self.id = id
                    self.title = title
                    self.ownerId = ownerId
                    self.membersId = membersId
                }
                
            }
            
        }
        
        public struct Accept {
            
            public struct Req: Content {
                
                /// Идентификатор чата
                public let spaceId: UUID
                
                /// Идентификатор пользоватедя
                public let userId: String
                
                // MARK: - Init
                
                public init(
                    spaceId: UUID,
                    userId: String
                ) {
                    self.spaceId = spaceId
                    self.userId = userId
                }
                
            }
            
        }
        
    }
    
}
