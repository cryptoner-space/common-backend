//
//  Admin_DeviceDto.swift
//  
//
//  Created by skibinalexander on 14.11.2022.
//

import Vapor

extension Admin_Dto {
    
    public struct DeviceDto {
        
        public struct Req: Content {
            
            /// Идентификатор девайса
            public let deviceId: UUID?
            
            /// Название девайса
            public let deviceName: String
            
        }
        
        public struct Res: Content {
            
            /// Идентификатор девайса
            public let deviceId: UUID
            
            /// Название девайса
            public let deviceName: String
            
            /// Доступность девайса
            public let isLocked: Bool
            
            /// Дата обновления
            public let updatedAt: Date?
            
            // MARK: - Init
            
            public init(
                deviceId: UUID,
                deviceName: String,
                isLocked: Bool,
                updatedAt: Date?
            ) {
                self.deviceId = deviceId
                self.deviceName = deviceName
                self.isLocked = isLocked
                self.updatedAt = updatedAt
            }
            
        }
        
        public struct Put {
            
            /// Идентификатор девайса
            public let deviceId: UUID?
            
            /// Название девайса
            public let deviceName: String
            
        }
        
        public struct Patch {
            
            public struct Req: Content {
                
                /// Параметр блокировки девайса
                public let locked: Bool
                
            }
            
        }
        
    }
    
}
