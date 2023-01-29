//
//  CBS_Dto+Content.swift
//  
//
//  Created by skibinalexander on 29.01.2023.
//

import CommonCryptonerData
import Vapor

extension CBS_Dto.Order.Res: Content {}
extension CBS_Dto.Order.Create.Req: Content {}
extension CBS_Dto.Order.Create.Res: Content {}
extension CBS_Dto.Order.List.Req: Content {}
extension CBS_Dto.Order.Authorized.Req: Content {}
extension CBS_Dto.Order.Cancel.Req: Content {}
extension CBS_Dto.Order.Pending.Req: Content {}
