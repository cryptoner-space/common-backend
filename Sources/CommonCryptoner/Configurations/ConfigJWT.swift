//
//  ConfigJWT.swift
//
//
//  Created by Alexander Skibin on 09.10.2024.
//

import Vapor
import JWT
import JWTKit

public struct ConfigJWT {
    
    // MARK: - Properties
    
    private(set) var app: Application
    
    // MARK: - Init
    
    public init(app: Application) {
        self.app = app
    }
    
    // MARK: - Implementation
    
    /// Initialization JWT
    /// - Parameters:
    ///   - publicKey: PublicKey format string
    ///   - privateKey: PrivateKey format string
    public func initConfigure(publicKeyBase64: String, privateKeyBase64: String) throws {
        let privateKey = try ECDSAKey.private(pem: privateKeyBase64.base64Decoded())
        let publicKey = try ECDSAKey.public(pem: privateKeyBase64.base64Decoded())
        
        let privateSigner = JWTSigner.es256(key: privateKey)
        let publicSigner = JWTSigner.es256(key: publicKey)
         
        app.jwt.signers.use(privateSigner, kid: .private)
        app.jwt.signers.use(publicSigner, kid: .public, isDefault: true)
    }
    
    /// Initialization JWT
    /// - Parameters:
    ///   - publicKey: PublicKey format string
    ///   - privateKey: PrivateKey format string
    public func initConfigure(hmac key: String) throws {
        let privateSigner = JWTSigner.hs256(key: key)
        let publicSigner = JWTSigner.hs256(key: key)
         
        app.jwt.signers.use(privateSigner, kid: .private)
        app.jwt.signers.use(publicSigner, kid: .public, isDefault: true)
    }
}
