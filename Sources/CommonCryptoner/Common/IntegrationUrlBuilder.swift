//
//  IntegrationUrlBuilder.swift
//  
//
//  Created by skibinalexander on 07.08.2022.
//

import Vapor
import BlockchainSdk
import CommonCryptonerData

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
                case .admin, .market, .chats, .p2p, .cbs, .cas:
                    self = .middle
                case .eth, .ton:
                    self = .low
                }
            }
        }
        
        public enum Dev: String {
            
            /// Адрес интеграционного серсиса администрирования бизнес-операций пользовательских данных
            case low = ""
            
            /// Адрес интеграционного серсиса администрирования бизнес операций криптовалюты
            case middle = "51.250.24.19"
            
            // MARK: - Init
            
            public init(_ service: Service) {
                switch service {
                case .admin, .market, .chats, .p2p, .cbs, .cas:
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

extension IntegrationUrlBuilder.Service {
    
    static public func from(_ blockchain: Blockchain) throws -> Self {
        switch blockchain {
        default:
            return .cas
        }
    }
    
}
