//
//  ConfigDAO+.swift
//
//
//  Created by skibinalexander on 23.10.2023.
//

import Foundation

public extension ConfigDAO {
    struct Input: LockboxPayload {
        
        /// Database HOST
        public let host: String
        
        /// Database username
        public let username: String
        
        /// Database password
        public let password: String
        
        // MARK: - Init
        
        public init(from response: LockboxResponse) {
            self.host = response.entries.first(where: { $0.key == "host" })!.textValue
            self.username = response.entries.first(where: { $0.key == "username" })!.textValue
            self.password = response.entries.first(where: { $0.key == "password" })!.textValue
        }
        
    }
}
