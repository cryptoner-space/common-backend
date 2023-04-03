//
//  LowLevelAdapterWalletInfoData.swift
//  
//
//  Created by skibinalexander on 03.04.2023.
//

import Foundation

public struct LowLevelAdapterWalletInfoData {
    
    // MARK: - Properties
    
    /// Баланс кошелька
    public let balance: Int64
    
    // MARK: - Init
    
    public init(balance: Int64) {
        self.balance = balance
    }
    
}
