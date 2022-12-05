//
//  MQBase+CAS.swift
//  
//
//  Created by skibinalexander on 02.12.2022.
//

import CommonVapor
import Vapor

extension MQBase {
    
    public struct CAS {
        
        public enum EventId: String {
            case update
        }
        
        public struct MQBodyCAS: MQBody {
            
            public var eventId: String
            
            public var payload: Data
            
            public init(eventId: String, payload: Data) {
                self.eventId = eventId
                self.payload = payload
            }
            
            public func cast<P>() throws -> P where P : Decodable, P : Encodable {
                guard let eventId = EventId(rawValue: eventId) else {
                    throw Abort(.notFound)
                }
                
                switch eventId {
                case .update:
                    return try JSONDecoder().decode(P.self, from: payload)
                }
            }
            
        }
        
        public struct Update: Codable {
            
            /// Идентификатор кошелька
            public let walletId: String
            
            /// Токен обнолвения баланса
            public let token: Blockchain.Token
            
            /// Значение обновления баланса
            public let value: Int64
            
            // MARK: - Init
            
            public init(
                walletId: String,
                token: Blockchain.Token,
                value: Int64
            ) throws {
                self.walletId = walletId
                self.token = token
                self.value = value
            }
            
        }
        
    }
    
}
