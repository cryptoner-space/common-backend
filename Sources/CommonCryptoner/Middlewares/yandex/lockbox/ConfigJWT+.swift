//
//  ConfigJWT+.swift
//  
//
//  Created by skibinalexander on 23.10.2023.
//

import CommonVapor

public extension ConfigJWT {
    struct Input: LockboxPayload {
        
        /// Public key
        public let publicKey: String
        
        /// Private key
        public let privateKey: String
        
        // MARK: - Init
        
        public init(from response: LockboxResponse) {
            self.publicKey = response.entries.first(where: { $0.key == "public_key" })!.textValue
            self.privateKey = response.entries.first(where: { $0.key == "private_key" })!.textValue
        }
        
    }
}
