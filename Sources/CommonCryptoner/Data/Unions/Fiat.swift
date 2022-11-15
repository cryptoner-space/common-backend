//
//  Fiat.swift
//  
//
//  Created by skibinalexander on 17.10.2022.
//

import Vapor

public enum Fiat: String, CaseIterable, Codable {
    case USD, RUB, EUR, UAH
    
    // MARK: - Static Map Fiat
    
    static func fiat(by symbol: String?) throws -> Fiat {
        guard let fiatCode = Fiat(rawValue: symbol ?? "") else {
            throw Abort(.badRequest, reason: "Wrapper not found type: \(String(describing: symbol))")
        }
        
        return fiatCode
    }
}
