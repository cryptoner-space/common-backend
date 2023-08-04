//
//  String+.swift
//  
//
//  Created by skibinalexander on 03.04.2023.
//

import Foundation

extension String {
    var vSlash: String {
        return self.isEmpty ? "" : self + "/"
    }
}
