//
//  Lock_Dto+Content.swift
//  
//
//  Created by skibinalexander on 25.03.2023.
//

import Vapor
import CommonCryptonerData

extension Lock_Dto.Secret.Req: Content {}
extension Lock_Dto.Secret.Res: Content {}

extension Lock_Dto.DEK_YC.Decrypt.Req: Content {}
extension Lock_Dto.DEK_YC.Decrypt.Res: Content {}

extension Lock_Dto.DEK_YC.Encrypt.Req: Content {}
extension Lock_Dto.DEK_YC.Encrypt.Res: Content {}

extension Lock_Dto.DEK.Encrypt.Res: Content {}
extension Lock_Dto.DEK.Decrypt.Req: Content {}
extension Lock_Dto.DEK.Decrypt.Res: Content {}

