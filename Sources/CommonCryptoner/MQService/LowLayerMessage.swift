//
//  LowLayerMessage.swift
//  
//
//  Created by skibinalexander on 07.11.2022.
//

import Foundation
import Vapor

public struct LowLayerMessage: Content {
    
    let service: LowMicroserviceName
    
    // MARK: - Init
    
    public init(service: LowMicroserviceName) {
        self.service = service
    }
    
}
