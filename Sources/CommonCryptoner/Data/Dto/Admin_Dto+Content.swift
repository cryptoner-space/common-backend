//
//  Admin_Dto+Content.swift
//  
//
//  Created by skibinalexander on 29.01.2023.
//

import Vapor
import CommonCryptonerData

extension Admin_Dto.Device.Req: Content {}
extension Admin_Dto.Device.Res: Content {}
extension Admin_Dto.Device.Patch.Req: Content {}
extension Admin_Dto.Device.Put.Req: Content {}
extension Admin_Dto.User.Req: Content {}
extension Admin_Dto.User.Res: Content {}
extension Admin_Dto.Init.Res: Content {}
extension Admin_Dto.SignIn.Init.Req: Content {}
extension Admin_Dto.SignUp.Init.Req: Content {}
