//
//  JWT+.swift
//  
//
//  Created by skibinalexander on 04.08.2023.
//

import Vapor
import JWT

extension String {
    public var bytes: [UInt8] { .init(self.utf8) }
}

extension JWKIdentifier {
    static public let `public` = JWKIdentifier(string: "public")
    static public let `private` = JWKIdentifier(string: "private")
}
