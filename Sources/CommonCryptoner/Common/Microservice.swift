//
//  Microservice.swift
//  
//
//  Created by skibinalexander on 02.12.2022.
//

import Vapor

public enum Infractructure {
    
    public enum Core: String, CaseIterable, Codable {
        
        /// Core Account Service
        case cas
        
        /// Core Banking Service
        case cbs
        
        /// Core Swap Service
        case swap
        
        /// Core Market Service
        case market
        
    }
    
    public enum MessageQueueUrl: String, CaseIterable {
        case market_external_mq = "dj600000000gh52500q0/core-market-ms-external-queue"
        case swap_external_mq = "dj600000000gif2m00q0/core-swap-ms-external-queue"
        case cbs_external_mq = "dj600000000gif3200q0/core-cbs-ms-external-queu"
        case chat_internal_mq
        
        public static func external(for service: Core) throws -> MessageQueueUrl {
            switch service {
            case .market:
                return .market_external_mq
            case .cbs:
                return .cbs_external_mq
            case .swap:
                return .swap_external_mq
            default:
                throw Infractructure.MQError.undefinedExternalMessageQueueUrl
            }
        }
    }
    
}

extension Infractructure {
    
    public enum MQError: Error {
        case undefinedExternalMessageQueueUrl
    }
    
}
