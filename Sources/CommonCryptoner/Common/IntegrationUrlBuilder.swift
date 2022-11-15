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
            case middle = "51.250.24.19"
            
            // MARK: - Init
            
            init(_ service: Service) {
                switch service {
                case .admin:
                    self = .middle
                case .wallets:
                    self = .middle
                case .market:
                    self = .middle
                case .chats:
                    self = .middle
                case .p2p:
                    self = .middle
                }
            }
        }
        
        public enum Dev: String {
            
            /// Адрес интеграционного серсиса администрирования бизнес-операций пользовательских данных
            case low = "low.cryptoner.space"
            
            /// Адрес интеграционного серсиса администрирования бизнес операций криптовалюты
            case middle = "middle.cryptoner.space"
            
            // MARK: - Init
            
            init(_ service: Service) {
                switch service {
                case .admin:
                    self = .middle
                case .wallets:
                    self = .middle
                case .market:
                    self = .middle
                case .chats:
                    self = .middle
                case .p2p:
                    self = .middle
                }
            }
        }
        
        // MARK: - Properties
        
        /// Микросервис интеграции
        let service: Service
        
        /// Хост интеграции
        let host: String
        
        // MARK: - Init
        
        init(_ env: Environment, service: Service) {
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
    }
    
    // MARK: - Properties
    
    /// Host by microservice
    private(set) var host: Host
    
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
    
    var vSlash: String {
        return self.isEmpty ? "" : self + "/"
    }
    
}
