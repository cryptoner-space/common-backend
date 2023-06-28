//
//  IntegrationUrlBuilder.swift
//  
//
//  Created by skibinalexander on 07.08.2022.
//

import Vapor
import BlockchainData
import CommonCryptonerData

/// Сервис конфигурации микросервисов
public struct IntegrationUrlBuilder {
    
    private(set) var host: String
    
    // MARK: - Implementaion
    
    /// Доступ к сервису
    public func remoteUrl(
        service: Service,
        apiVersion: ApiVersion = .v1,
        paths: Path...,
        query: String? = nil,
        parameter: String? = nil
    ) -> URI {
        URI(
            scheme: .http,
            host: "",
            port: nil,
            path:
                service.rawValue.vSlash +
                apiVersion.rawValue.vSlash +
                (paths.compactMap { $0.rawValue }
                    .joined(separator: "/"))
                    .replacingOccurrences(of: "//", with: "/").vSlash +
                (parameter ?? "")
            ,
            query: query
        )
    }
    
}

extension IntegrationUrlBuilder {
    /// Api доступ интеграционного сервиса
    public enum ApiVersion: String {
        case none = ""
        case v1 = "api/v1"
    }
    
    public enum Service: String {
        case admin = "admin-ms"
        case market = "market-ms"
        case p2p = "p2p-ms"
        case chats = "chats-ms"
        case cbs = "cbs-ms"
        case cas = "cas-ms"
        case eth = "eth-ms"
        case ton = "ton-ms"
    }
    
    public enum Path: String {
        case auth
        case user
        case accounts
        case account
        case id
        case device
        case wallets
        case currencies
        case crypto
        case fiat
        case stock
        case available
        case transactions
        case restore
        case recovery
        case list
        case balance
        case fee
        case merchants
        case orders
        case sales
        case growth
        case create
        case pending
        case cancel
        case proposals
        case fiatPayments = "fiat-payments"
        case buy
        case accept
        case count
        case find
        case spaces
        
        // MARK: - Helper
        
        public var path: PathComponent {
            .init(stringLiteral: self.rawValue)
        }
    }
}
