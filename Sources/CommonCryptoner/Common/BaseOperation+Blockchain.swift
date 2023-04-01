//
//  BaseOperation+Blockchain.swift
//  
//
//  Created by skibinalexander on 17.11.2022.
//

import CommonVapor

extension OperationItem where Input == RequestOperation<FullOperationDependencies> {
    
    public func urlBuilder(to service: IntegrationUrlBuilder.Service) -> IntegrationUrlBuilder {
        IntegrationUrlBuilder(host: .init(input.app.environment, service: service))
    }
    
}
