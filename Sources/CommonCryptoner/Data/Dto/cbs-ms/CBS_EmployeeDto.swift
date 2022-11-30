//
//  CBS_EmployeeDto.swift
//  
//
//  Created by skibinalexander on 30.11.2022.
//

import Vapor

extension CBS_Dto {
    
    public struct Employee {
        
        public struct Res: Content {
            
            /// Идентификатор сотрудника системы
            public let id: UUID
            
            // MARK: - Init
            
            public init(
                id: UUID
            ) {
                self.id = id
            }
            
        }
        
    }
    
}
