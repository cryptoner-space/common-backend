//
//  CAS_Dto+Content.swift
//  
//
//  Created by skibinalexander on 29.01.2023.
//

import CommonCryptonerData
import Vapor

extension CAS_Dto.Account.Req: Content {}
extension CAS_Dto.Account.Res: Content {}
extension CAS_Dto.Wallet.Res: Content {}
extension CAS_Dto.Wallet.Create.Req: Content {}
extension CAS_Dto.Wallet.Create.Res: Content {}
extension CAS_Dto.Wallet.Recovery.Req: Content {}
extension CAS_Dto.Wallet.Recovery.Res: Content {}
extension CAS_Dto.Wallet.Restore.Req: Content {}
extension CAS_Dto.Wallet.Restore.Res: Content {}
extension CAS_Dto.WalletItem.Res: Content {}
extension CAS_Dto.Token.Push.Req: Content {}
extension CAS_Dto.Token.Pull.Req: Content {}
