//
//  P2P_App_Dto+Content.swift
//  
//
//  Created by skibinalexander on 29.01.2023.
//

import CommonCryptonerData
import Vapor

extension AppStatusDto.Res: Content {}
extension AppStatusDto.Support: Content {}
extension FeatureDto.Res: Content {}
extension TotalDto.Req: Content {}
extension TotalDto.Res: Content {}
extension DeviceDto.Req: Content {}
extension DeviceDto.Res: Content {}
extension AccountDto.Res: Content {}
extension AccountDto.Req: Content {}
extension AccountDto.Wallet.Item: Content {}
extension Auth_Dto.Authentificator: Content {}
extension User_Dto.Req: Content {}
extension User_Dto.Res: Content {}
extension P2PDto.Order.Res: Content {}
extension P2PDto.Order.List.Req: Content {}
extension P2PDto.Token.Res: Content {}
extension P2PDto.Token.List.Req: Content {}
extension VirtualWalletDto.Order.Create.Req: Content {}
extension VirtualWalletDto.Order.Cancel.Req: Content {}
extension VirtualWalletDto.Order.Confirm.Req: Content {}
extension Wallet_Dto.Res: Content {}
extension Wallet_Dto.Item.Res: Content {}
extension Widget_Dto.Order.Res: Content {}
extension Widget_Dto.Account.Res: Content {}
extension Widget_Dto.CryptoCharts.Res: Content {}
