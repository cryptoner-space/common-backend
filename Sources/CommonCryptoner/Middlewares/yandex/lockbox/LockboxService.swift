//
//  Lockbox.swift
//  
//
//  Created by skibinalexander on 09.11.2022.
//

import Vapor

public struct LockboxService<P: LockboxPayload> {
    
    // MARK: - Properties
    
    private(set) var app: Application
    private(set) var secretId: String
    
    // MARK: - Init
    
    public init(app: Application, secretId: String) {
        self.app = app
        self.secretId = secretId
    }
    
    // MARK: - Implementation
    
    private func execute(_ iam: String?, secretId: String) async throws -> P {
        guard let iam = iam else {
            throw Abort(.serviceUnavailable, reason: "Yandex Lockbox Service unavailable!")
        }
            
        let res = try await app.client.get(
            .init(string: "https://payload.lockbox.api.cloud.yandex.net/lockbox/v1/secrets/\(secretId)/payload")
        ) { req in
            req.headers.bearerAuthorization = .init(token: iam)
            req.headers.contentType = .json
        }
        
        guard res.status == .ok else {
            throw Abort(.serviceUnavailable, reason: "Yandex Lockbox Service unavailable after request!")
        }
        
        let result = try res.content.decode(LockboxResponse.self, using: JSONDecoder())
        
        return P(from: result)
    }
    
}

extension LockboxService {
    fileprivate struct IAM: Content {
        let access_token: String
        let expires_in: Int
        let token_type: String
    }
}
