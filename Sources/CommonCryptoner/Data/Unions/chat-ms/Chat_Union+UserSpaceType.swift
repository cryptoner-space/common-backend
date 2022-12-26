//
//  Chat_Union+UserSpaceType.swift
//  
//
//  Created by skibinalexander on 26.12.2022.
//

import Foundation

extension Chat_Union {
    
    /// Тип пространства
    public enum UserSpaceType: String, Codable {
        
        // MARK: - Static
        
        static public let scheme: String = "user_space_type_enum_001"
        
        // MARK: - Properties
        
        /// Пространство пользователя
        case user = "USER"
        
        /// Пространство группы
        case group = "GROUP"
        
    }
    
}
