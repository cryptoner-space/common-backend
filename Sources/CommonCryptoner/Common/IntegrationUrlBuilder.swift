//
//  IntegrationUrlBuilder.swift
//  
//
//  Created by skibinalexander on 07.08.2022.
//

import Vapor

/// Сервис конфигурации микросервисов
public struct IntegrationUrlBuilder {
    
    public struct Host {
        
        public enum Prod: String {
            
            /// Адрес сервисов Low level
            case low = "10.129.0.17"
            
            /// Адрес сервисов MIddle level
            case middle = "10.129.0.12"
            
            // MARK: - Init
            
            public init(_ service: Service) {
                switch service {
                case .admin, .wallets, .market, .chats, .p2p:
                    self = .middle
                case .eth, .ton:
                    self = .low
                }
            }
        }
        
        public enum Dev: String {
            
            /// Адрес интеграционного серсиса администрирования бизнес-операций пользовательских данных
            case low = "low.cryptoner.space"
            
            /// Адрес интеграционного серсиса администрирования бизнес операций криптовалюты
            case middle = "51.250.24.19"
            
            // MARK: - Init
            
            public init(_ service: Service) {
                switch service {
                case .admin, .wallets, .market, .chats, .p2p:
                    self = .middle
                case .eth, .ton:
                    self = .low
                }
            }
        }
        
        // MARK: - Properties
        
        /// Микросервис интеграции
        public let service: Service
        
        /// Хост интеграции
        public let host: String
        
        // MARK: - Init
        
        public init(_ env: Environment, service: Service) {
            self.service = service
            
            if env.isRelease {
                self.host = Prod(service).rawValue
            } else {
                self.host = Dev(service).rawValue
            }
        }
    }
    
    /// Api доступ интеграционного сервиса
    public enum ApiVersion: String {
        case none = ""
        case v1 = "api/v1"
    }
    
    public enum Service: String {
        case admin = "admin-ms"
        case wallets = "wallets-ms"
        case market = "market-ms"
        case p2p = "p2p-ms"
        case chats = "chats-ms"
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
    }
    
    // MARK: - Properties
    
    /// Host by microservice
    private(set) var host: Host
    
    // MARK: - Init
    
    public init(host: Host) {
        self.host = host
    }
    
    // MARK: - Implementaion
    
    /// Доступ к сервису
    public func remoteUrl(
        apiVersion: ApiVersion = .v1,
        paths: Path...,
        query: String? = nil,
        parameter: String? = nil
    ) -> URI {
        URI(
            scheme: .http,
            host: host.host,
            port: nil,
            path:
                host.service.rawValue.vSlash +
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

extension String {
    
    public var vSlash: String {
        return self.isEmpty ? "" : self + "/"
    }
    
}
