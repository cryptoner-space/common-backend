//
//  MockStorageProtocol.swift
//
//
//  Created by Alexander Skibin on 24.10.2024.
//

import Foundation
import Vapor

public protocol MockStorageProtocol {
    var directory: DirectoryConfiguration { get }
    
    func parse(_ filename: String) throws -> JSON
}

extension MockStorageProtocol {
    public func parse(_ filename: String) throws -> JSON {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: directory.publicDirectory)
                .appendingPathComponent("Mock", isDirectory: true)
                .appendingPathComponent("\(filename).json", isDirectory: false))
            
            guard !data.isEmpty else {
                throw Abort(.internalServerError, reason: MockStorageError.emptyData(filename: filename).localizedDescription)
            }
            
            return JSON(data)
        } catch {
            throw MockStorageError.failedParseJsonBy(filename: filename)
        }
    }
}
