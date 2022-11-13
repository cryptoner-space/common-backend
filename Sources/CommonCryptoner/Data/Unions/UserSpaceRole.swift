//
//  UserSpaceRole.swift
//  
//
//  Created by Скибин Александр on 14.05.2022.
//

import Foundation

/// Роль пользователя в  пространства
public enum UserSpaceRole: String, Codable, CaseIterable {
    
    // MARK: - Static
    
    static let scheme: String = "user_space_role_enum_001"
    
    // MARK: - Properties
    
    /// Пространство пользователя
    case admin = "ADMIN"
    
    /// Пространство группы
    case participant = "PARTICIPANT"
    
}
