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
            let id: UUID
            
        }
        
    }
    
}
