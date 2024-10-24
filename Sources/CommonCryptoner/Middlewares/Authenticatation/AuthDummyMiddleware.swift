//
//  AuthDummyMiddleware.swift
//
//
//  Created by Alexander Skibin on 24.10.2024.
//

import Vapor

private let dummyAuthId = UUID(uuidString: "aa3510f0-1e5f-4ce8-910f-68f6d866d47a")!
private let dummyRecoveryId = UUID(uuidString: "782dcc27-a2db-43ab-9dbc-5e9d576dbb91")!
private let dummyExternalId = UUID(uuidString: "f97c4504-8d60-4f72-b6eb-f759bafe8088")!

public struct AuthDummyMiddleware<P: AuthenticatableID>: BearerAuthenticator {
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Implementation

    public func authenticate(bearer: BearerAuthorization, for request: Request) -> EventLoopFuture<Void> {
        request.eventLoop
            .future()
            .flatMapThrowing { jwt in
                request.auth.login(
                    AuthSignUserData(
                        id: dummyAuthId,
                        recoveryId: dummyRecoveryId,
                        recoveryKey: "demo@cryptoner.space",
                        externalId: dummyExternalId.uuidString
                    )
                )
            }
   }
    
}
