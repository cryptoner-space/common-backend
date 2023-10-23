//
//  ConfigMQ+.swift
//
//
//  Created by skibinalexander on 23.10.2023.
//

import CommonVapor

public extension ConfigMQ {
    struct Input: LockboxPayload {
        /// Id service account
        public let accessKeyId: String
        
        /// Secret service account
        public let secretAccessKey: String
        
        // MARK: - Init
        
        public init(from response: LockboxResponse) {
            self.accessKeyId = response.entries.first(where: { $0.key == "access_id" })!.textValue
            self.secretAccessKey = response.entries.first(where: { $0.key == "private_key" })!.textValue
        }

    }

}
