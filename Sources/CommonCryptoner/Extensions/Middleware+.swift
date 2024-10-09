//
//  Middlewares.swift
//
//
//  Created by Alexander Skibin on 09.10.2024.
//

import Vapor

public extension Middlewares {
    func resolve<S: Middleware>() throws -> S? {
        self.resolve().first(where: { ($0 as? S) != nil }) as? S
    }
}
