//
//  MicroserviceMessage.swift
//  
//
//  Created by skibinalexander on 07.11.2022.
//

import Foundation
import Vapor

public struct MQBaseMessage {
    
    public struct MiddToMidd<P: Content>: Content {

        /// Сервис отправитель
        public let source: Microservice.Middle

        /// Сервис получатель
        public let destination: Microservice.Middle
        
        /// Контент
        public let payload: P
        
        // MARK: - Init
        
        public init(
            source: Microservice.Middle,
            destination: Microservice.Middle,
            payload: P
        ) {
            self.source = source
            self.destination = destination
            self.payload = payload
        }
        
    }
    
}
