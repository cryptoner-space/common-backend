//
//  BaseDto+Content.swift
//  
//
//  Created by skibinalexander on 29.01.2023.
//

import Vapor
import CommonCryptonerData

extension BaseDto.Id.Req: Content {}
extension BaseDto.Id.Res: Content {}
extension BaseDto.Obj.Res: Content {}
extension BaseDto.List.Res: Content {}
extension BaseDto.List.Req: Content {}
extension BaseDto.List.Group.Res: Content {}
