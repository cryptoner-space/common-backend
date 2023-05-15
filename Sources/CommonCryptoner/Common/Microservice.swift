//
//  Microservice.swift
//  
//
//  Created by skibinalexander on 02.12.2022.
//

import Vapor

public enum Infractructure {
    
    public enum Core: String, CaseIterable, Codable {
        
        /// Core Account Service
        case cas
        
        /// Core Banking Service
        case cbs
        
        /// Core Swap Service
        case swap
        
        /// Core Market Service
        case market
        
    }
    
}
