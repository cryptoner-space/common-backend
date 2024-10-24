//
//  YandexIntegrationUrlBuilder.swift
//
//
//  Created by Alexander Skibin on 23.10.2024.
//

import Foundation
import Vapor

/// Сервис конфигурации Yandex интеграции
public struct YandexIntegrationUrlBuilder {
    
    /// Адрес интеграционного крипто сервиса
    private let integration_host = "kms.yandex"
    
    /// Api доступ интеграционного сервиса
    public enum ApiVersion: String {
        case v1 = "v1"
    }
    
    /// Набор сервис ендпоинтов
    public enum Services: String {
        case kms
    }
    
    public enum Paths: String {
        case keys
    }
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Implementation
    
    /// Доступ к сервису
    public func remoteUrl(
        apiVersion: ApiVersion = .v1,
        service: Services,
        paths: String...,
        query: String? = nil,
        parameter: String? = nil
        
    ) -> URI {
        URI(
            scheme: .https,
            host: integration_host,
            port: nil,
            path:
                service.rawValue + "/" +
                apiVersion.rawValue + "/" +
                (paths.compactMap { $0 }
                    .joined(separator: "/"))
                    .replacingOccurrences(of: "//", with: "/")
            ,
            query: query
        )
    }
}
