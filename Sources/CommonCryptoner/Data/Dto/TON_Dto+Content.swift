//
//  TON_Dto+Content.swift
//  
//
//  Created by skibinalexander on 19.03.2023.
//

import Vapor
import CommonCryptonerData

extension TON_Dto.Info.Req: Content {}
extension TON_Dto.Info.Res: Content {}
extension TON_Dto.Fee: Content {}
extension TON_Dto.SendBoc: Content {}
extension TON_Dto.Seqno: Content {}
extension TON_Dto.SourceFees: Content {}
extension TON_Dto.Stack: Content {}
