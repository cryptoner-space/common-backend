//
//  P2P_Dto+Content.swift
//  
//
//  Created by skibinalexander on 29.01.2023.
//

import Vapor
import CommonCryptonerData

extension P2P_Dto.List.Req: Content {}
extension P2P_Dto.Order.List.Req: Content {}
extension P2P_Dto.Order.Create.Req: Content {}
extension P2P_Dto.Order.Count.Res: Content {}
extension P2P_Dto.Order.Res: Content {}
extension P2P_Dto.FiatPayment.Req: Content {}
extension P2P_Dto.FiatPayment.Res: Content {}
extension P2P_Dto.Merchant.Req: Content {}
extension P2P_Dto.Merchant.Res: Content {}
extension P2P_Dto.Merchant.Patch.Req: Content {}
extension P2P_Dto.OrderProposal.Req: Content {}
extension P2P_Dto.OrderProposal.List.Req: Content {}
