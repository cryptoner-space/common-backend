//
//  MessageQueueUrl.swift
//  
//
//  Created by skibinalexander on 15.05.2023.
//

import Foundation

public enum MessageQueueUrl: String, CaseIterable {
    case market_external_mq = "core-market-ms-external-queue"
    case swap_external_mq
    case cbs_external_mq
    case chat_internal_mq
}
