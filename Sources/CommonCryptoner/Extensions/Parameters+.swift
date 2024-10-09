//
//  Parameters+.swift
//  
//
//  Created by Alexander Skibin on 09.10.2024.
//

import Vapor

public extension Parameters {
    func getOrThrows<T>(_ name: String, as type: T.Type = T.self) throws -> T where T: LosslessStringConvertible {
        if let value = get(name, as: type) {
            return value
        } else {
            throw Abort(.badRequest)
        }
    }
}
