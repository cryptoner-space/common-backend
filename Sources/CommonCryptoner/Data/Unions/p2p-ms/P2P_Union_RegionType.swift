//
//  File.swift
//  
//
//  Created by skibinalexander on 08.01.2023.
//

import Vapor
import Fluent

extension P2P_Union {
    
    /// Способы получения платежа
    public enum RegionType: String, CaseIterable, Codable {
        
        // MARK: - Cases
        
        case RU, UA, BY, KZ
        
    }
    
}

extension P2P_Union.RegionType {
    static public let scheme: String = "p2p_region_type_enum_001"
    static public let relation: FieldKey = .init(stringLiteral: "type")
}
