//
//  LockboxResponse.swift
//  
//
//  Created by skibinalexander on 09.11.2022.
//

import Vapor

public struct LockboxResponse: Content {
    public struct KeyPair: Content {
        public let key: String
        public let textValue: String
        
        public init(key: String, textValue: String) {
            self.key = key
            self.textValue = textValue
        }
    }
    
    /// Данные секрета
    public let entries: [KeyPair]
}


public protocol LockboxPayload: Content {
    init(from response: LockboxResponse)
}
