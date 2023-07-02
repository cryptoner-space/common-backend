//
//  Microservice.swift
//  
//
//  Created by skibinalexander on 02.12.2022.
//

import Vapor

public enum Infractructure {}

// MARK: - Infrastructure Core

extension Infractructure {
    
    public enum Core: String, CaseIterable, Codable {
        
        /// Core Account Services
        case cas
        
        /// Core Banking Services
        case cbs
        
        /// Core Swap Services
        case swap
        
        /// Core Market Services
        case market
        
        /// Core P2P Services
        case p2p
        
        /// Core Admin Servies
        case admin
        
        // MARK: - Helper
        
        var providerUrl: String {
            return "\(self.rawValue)-ms"
        }
        
    }
    
}

// MARK: - Infractructure Support Apps

extension Infractructure {
    
    public enum Apps: String, CaseIterable, Codable {
        
        /// Telegram Bot P2P service
        case telegramBot_P2P
        
    }
    
}

// MARK: - Errors

extension Infractructure.Core {
    
    public enum MessageQueueUrl: String, CaseIterable {
        case market_external_mq = "dj600000000gh52500q0/core-market-ms-external-queue"
        case swap_external_mq = "dj600000000gif2m00q0/core-swap-ms-external-queue"
        case cbs_internal_mq = "dj600000000gtor600q0/core-cbs-ms-internal-queue"
        case cbs_external_mq = "dj600000000gif3200q0/core-cbs-ms-external-queue"
        case p2p_internal_mq = "dj600000000gtor600q0/core-p2p-ms-internal-queue"
        case p2p_external_mq = "dj600000000gtor600q0/core-p2p-ms-external-queue"
        case admin_external_mq = "dj600000000jl7l100q0/core-admin-ms-external-queue"
        case admin_internal_mq = "dj600000000jl7l100q0/core-admin-ms-internal-queue"
        
        public static func external(for service: Infractructure.Core) throws -> MessageQueueUrl {
            switch service {
            case .market:
                return .market_external_mq
            case .cbs:
                return .cbs_external_mq
            case .swap:
                return .swap_external_mq
            case .p2p:
                return .p2p_external_mq
            case .admin:
                return .admin_external_mq
            default:
                throw MQError.undefinedExternalMessageQueueUrl
            }
        }
        
        public static func `internal`(for service: Infractructure.Core) throws -> MessageQueueUrl {
            switch service {
            case .cbs:
                return .cbs_internal_mq
            case .p2p:
                return .p2p_internal_mq
            case .admin:
                return .admin_internal_mq
            default:
                throw MQError.undefinedExternalMessageQueueUrl
            }
        }
    }
    
    public enum MQError: Error {
        case undefinedExternalMessageQueueUrl
    }
    
}
