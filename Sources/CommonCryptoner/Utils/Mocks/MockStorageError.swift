//
//  MockStorageError.swift
//
//
//  Created by Alexander Skibin on 24.10.2024.
//

import Foundation

// MARK: - Errors

enum MockStorageError: LocalizedError {
    case failedParseJsonBy(filename: String)
    case emptyData(filename: String)
}
