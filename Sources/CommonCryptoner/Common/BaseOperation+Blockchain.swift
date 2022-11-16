//
//  BaseOperation+Blockchain.swift
//  
//
//  Created by skibinalexander on 17.11.2022.
//

import CommonVapor

extension BaseOperation {
    
    public func urlBuilder(to service: IntegrationUrlBuilder.Service) -> IntegrationUrlBuilder {
        IntegrationUrlBuilder(host: .init(app.environment, service: service))
    }
    
}
