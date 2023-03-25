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

extension Lock_Dto.DEK.Req: Content {}
extension Lock_Dto.DEK.Res: Content {}

