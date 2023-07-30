//
//  Swap_Dto+Content.swift
//  
//
//  Created by skibinalexander on 17.05.2023.
//

import Vapor
import CommonCryptonerData

extension Swap_Dto.Order.User.Init.Res: Content {}
extension Swap_Dto.Order.User.Create.Req: Content {}
extension Swap_Dto.Order.Employee.Approve.Req: Content {}
extension Swap_Dto.Order.Employee.List.Res: Content {}
extension Swap_Dto.Order.Meta.Req: Content {}
extension Swap_Dto.Order.Meta.Res: Content {}
extension Swap_Dto.Exchange.Res: Content {}
extension Swap_Dto.Currency.Res: Content {}
