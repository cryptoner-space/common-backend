//
//  ProviderUrlBuilder.swift
//  
//
//  Created by skibinalexander on 03.04.2023.
//

import Vapor
import BlockchainData
import CommonCryptonerData

/// Сервис конфигурации микросервисов
public struct ProviderUrlBuilder {
    
    public enum Host: String {
        case local = "localhost"
        case internal_node = "10.129.0.12"
        case external_node = "core.cryptoner.space"
        
        public init(_ env: Environment) throws {
            self = env.isRelease ? .internal_node : .external_node
        }
    }
    
    /// Api доступ интеграционного сервиса
    public enum ApiVersion: String {
        case none = ""
        case v1 = "api/v1"
    }
    
    public enum Adapter: String {
        case ton = "ton"
        case btc = "btc"
        case eth = "eth"
    }
    
    // MARK: - Properties
    
    /// Host by microservice
    private(set) var host: Host
    
    /// Host by microservice
    private(set) var core: Infractructure.Core
    
    // MARK: - Init
    
    public init(host: Host, core: Infractructure.Core) {
        self.host = host
        self.core = core
    }
    
    // MARK: - Implementaion
    
    /// Доступ к сервису
    public func remoteUrl(
        apiVersion: ApiVersion = .v1,
        paths: Path...,
        query: String? = nil
    ) -> URI {
        URI(
            scheme: .http,
            host: host.rawValue,
            port: nil,
            path:
                "provider-ms".vSlash +
                apiVersion.rawValue.vSlash +
                core.providerUrl.vSlash +
                (paths.compactMap { $0.path.description }
                    .joined(separator: "/")
                ).replacingOccurrences(of: "//", with: "/").vSlash
            ,
            query: query
        )
    }
    
}

extension ProviderUrlBuilder {
    
    public enum Path {
        case value(String)
        case adapterPath(AdapterPath)
        
        // MARK: - Helper
        
        public var path: PathComponent {
            switch self {
            case .value(let path):
                return .init(stringLiteral: path)
            case .adapterPath(let path):
                return .init(stringLiteral: path.rawValue)
            }
        }
    }
    
}

// MARK: - AdapterPath

extension ProviderUrlBuilder {
    
    public enum AdapterPath: String {
        case info = "info"
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
    }
    
}
