//
//  Market_Dto+Content.swift
//  
//
//  Created by skibinalexander on 29.01.2023.
//

import Vapor
import CommonCryptonerData

extension Market_Dto.Agregate.List.Req: Content {}
extension Market_Dto.Agregate.List.Res: Content {}
extension Market_Dto.Agregate.Item: Content {}
extension Market_Dto.Growth.Req: Content {}
extension Market_Dto.Growth.Res: Content {}
extension Market_Dto.Stock.Res: Content {}
extension Market_Dto.Calculate.Req: Content {}
extension Market_Dto.Calculate.Res: Content {}
extension Market_Dto.Calculate.Item.Req: Content {}
extension Market_Dto.Calculate.Item.Res: Content {}
extension Market_Dto.Calculate.Total.Res: Content {}
