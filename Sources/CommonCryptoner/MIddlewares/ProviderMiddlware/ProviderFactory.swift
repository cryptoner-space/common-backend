//
//  ProviderFactory.swift
//  
//
//  Created by skibinalexander on 03.04.2023.
//

import Vapor
import BlockchainData
import CommonCryptonerData
import CommonVapor

public enum ProviderError: Error {
    case wrongMakeFactoryBlockchain
    case wrongBlockchainAdapter
    case wrongMethodNotImplemented
}

public protocol ProviderAdapter: AnyObject {
    
    /// Блокчейн адаптер кошелька
    var blockchain: Blockchain { get set }
    
    /// Request input container
    var input: RequestOperation<FullOperationDependencies>! { get set }
    
    // MARK: - Init
    
    init() throws
    
    // MARK: - Implementation
    
    /// Получить информацию по кошельку
    func updateInfoWallet(id: UUID, for address: String) throws -> EventLoopFuture<ProviderWalletInfoData?>
    
}

public struct ProviderFactory {
    
    static public func makeAdapter(for blockchain: Blockchain) throws -> ProviderAdapter {
        switch blockchain {
        case .toncoin:
            return try TONProviderAdapter()
        case .ethereum:
            return try ETHProviderAdapter()
        case .bitcoin:
            return try BTCProviderAdapter()
        default:
            throw ProviderError.wrongMakeFactoryBlockchain
        }
    }
    
}
