//
//  Blockchain+Content.swift
//  
//
//  Created by skibinalexander on 09.05.2023.
//

import Vapor
import BlockchainSdk
import CommonCryptonerData

extension Currency.Crypto: Content {}
extension Currency.Fiat: Content {}
