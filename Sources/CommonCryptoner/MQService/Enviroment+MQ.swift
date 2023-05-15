//
//  Enviroment+MQ.swift
//  
//
//  Created by skibinalexander on 15.05.2023.
//

import Vapor

extension Environment {
    
    func baseUrlMQ(with target: String) -> String? {
        Self.get("BASE_MQ_QUEUE_URL")?.appending("/\(target)")
    }
    
}
