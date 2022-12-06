//
//  UserSpaceType.swift
//  
//
//  Created by Скибин Александр on 08.11.2021.
//

import Vapor

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
