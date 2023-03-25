//
//  Market_Dto+Content.swift
//  
//
//  Created by skibinalexander on 29.01.2023.
//

import Vapor
import CommonCryptonerData

extension Market_Dto.Agregate.Req: Content {}
extension Market_Dto.Agregate.Res: Content {}
extension Market_Dto.Agregate.Item: Content {}
extension Market_Dto.Growth.Req: Content {}
extension Market_Dto.Growth.Res: Content {}
extension Market_Dto.Currency.Crypto: Content {}
extension Market_Dto.Currency.Fiat: Content {}
extension Market_Dto.Stock: Content {}
