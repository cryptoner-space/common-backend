//
//  LowLevelBlockchainAdapter.swift
//  
//
//  Created by skibinalexander on 03.04.2023.
//

import Vapor
import BlockchainSdk
import CommonCryptonerData
import CommonVapor

public enum LowLevelBlockchainAdapterError: Error {
    case wrongMakeFactoryBlockchain
    case wrongBlockchainAdapter
    case wrongMethodNotImplemented
}

public protocol LowLevelBlockchainAdapter: AnyObject {
    
    /// Блокчейн адаптер кошелька
    var blockchain: Blockchain { get set }
    
    /// Request input container
    var input: RequestOperation<FullOperationDependencies>! { get set }
    
    // MARK: - Init
    
    init() throws
    
    // MARK: - Implementation
    
    /// Получить информацию по кошельку
    func updateInfoWallet(id: UUID, for address: String) throws -> EventLoopFuture<LowLevelAdapterWalletInfoData>
    
}

public struct LowLevelBlockchainAdapterFactory {
    
    static public func makeAdapter(for blockchain: Blockchain) throws -> LowLevelBlockchainAdapter {
        switch blockchain {
        case .toncoin:
            return try TONLowLevelAdapter()
        default:
            throw LowLevelBlockchainAdapterError.wrongMakeFactoryBlockchain
        }
    }
    
}
