//
//  TON_Dto+Content.swift
//  
//
//  Created by skibinalexander on 19.03.2023.
//

import CommonCryptonerData
import Vapor

extension TON_Dto.Info: Content {}
extension TON_Dto.Fee: Content {}
extension TON_Dto.SendBoc: Content {}
extension TON_Dto.Seqno: Content {}
extension TON_Dto.SourceFees: Content {}
extension TON_Dto.Stack: Content {}
