//
//  CBS_Dto+Content.swift
//  
//
//  Created by skibinalexander on 29.01.2023.
//

import Vapor
import CommonCryptonerData

extension CBS_Dto.Currency.Res: Content {}
extension CBS_Dto.Depository.Create.Req: Content {}
extension CBS_Dto.Depository.List.Res: Content {}
extension CBS_Dto.Depository.Item.Res: Content {}
extension CBS_Dto.Employee.Res: Content {}
