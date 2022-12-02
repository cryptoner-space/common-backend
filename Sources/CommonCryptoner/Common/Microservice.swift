//
//  Microservice.swift
//  
//
//  Created by skibinalexander on 02.12.2022.
//

import Vapor

public struct Microservice {
    
    public enum Middle: String, CaseIterable, Codable {
        
        /// Core Account Service
        case cas
        
        /// Core Banking Service
        case cbs
        
    }
    
}
