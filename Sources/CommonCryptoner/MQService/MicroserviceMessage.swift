//
//  MicroserviceMessage.swift
//  
//
//  Created by skibinalexander on 07.11.2022.
//

import Foundation
import Vapor

public struct MicroserviceMessage<P: Content>: Content {
    
    /// Сервис отправитель
    let sourceId: String
    
    /// Сервис получатель
    let destinationId: String
    
    /// Контент
    let payload: P
    
    // MARK: - Init
    
    public init(
        sourceId: String,
        destinationId: String,
        payload: P
    ) {
        self.sourceId = sourceId
        self.destinationId = destinationId
        self.payload = payload
    }
    
}
