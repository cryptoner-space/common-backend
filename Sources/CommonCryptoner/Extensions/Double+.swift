//
//  Double+.swift
//
//
//  Created by Alexander Skibin on 09.10.2024.
//

import Foundation

extension Int64 {
    public var nano: Double { Double(self) * 0.000000001 }
}

extension Double {
    public var nano: Int64 { Int64(Double(self) * 1000000000) }
}
