//
//  Admin_Dto+Content.swift
//  
//
//  Created by skibinalexander on 29.01.2023.
//

import CommonCryptonerData
import Vapor

extension Admin_Dto.Device.Req: Content {}
extension Admin_Dto.Device.Res: Content {}
extension Admin_Dto.Device.Patch.Req: Content {}
extension Admin_Dto.Device.Put.Req: Content {}
extension Admin_Dto.User.Req: Content {}
extension Admin_Dto.User.Res: Content {}
