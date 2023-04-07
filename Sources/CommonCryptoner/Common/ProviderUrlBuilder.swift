//
//  ProviderUrlBuilder.swift
//  
//
//  Created by skibinalexander on 03.04.2023.
//

import Vapor
import BlockchainSdk
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
    private(set) var adapter: Adapter
    
    // MARK: - Init
    
    public init(host: Host, adapter: Adapter) {
        self.host = host
        self.adapter = adapter
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
                "provider-ms",
                apiVersion.rawValue.vSlash +
                adapter.rawValue.vSlash +
                (paths.compactMap { $0.path.description }
                    .joined(separator: "/")
                ).replacingOccurrences(of: "//", with: "/").vSlash
            ,
            query: query
        )
    }
    
}

extension ProviderUrlBuilder {
    
    public enum AdapterPath: String {
        case info = "info"
    }
    
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
