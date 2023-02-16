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
extension Feature_Dto.Res: Content {}
extension Auth_Dto.Authentificator: Content {}
extension User_Dto.Req: Content {}
extension User_Dto.Res: Content {}
extension Order.Res: Content {}
extension Order.List.Req: Content {}
extension Order.Token.Res: Content {}
extension Order.Token.List.Req: Content {}
extension Widget_Dto.Order.Res: Content {}
extension Widget_Dto.CryptoCharts.Res: Content {}
