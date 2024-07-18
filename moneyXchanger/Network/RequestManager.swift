//
//  RequestManager.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/3/24.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

final class RequestManager: RequestManagerProtocol {
    let networkManager: NetworkManagerProtocol
    let parser: DataParserProtocol
    let accessTokenManager: AccessTokenManagerProtocol

    init(
        networkManager: NetworkManagerProtocol = NetworkManager(),
        parser: DataParserProtocol = DataParser(),
        accessTokenManager: AccessTokenManagerProtocol = AccessTokenManager()
    ) {
        self.networkManager = networkManager
        self.parser = parser
        self.accessTokenManager = accessTokenManager
    }

    func requestAccessToken() async throws -> String {
        if accessTokenManager.isTokenValid() {
            return accessTokenManager.fetchToken()
        }

        let data = try await networkManager.requestToken()
        let token: APIToken = try parser.parse(data: data)
        try accessTokenManager.refreshWith(apiToken: token)
        return token.bearerAccessToken
    }

    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        var authToken = ""
        if request.addAuthorizationToken {
            authToken = try await requestAccessToken()
        }
        let data = try await networkManager.perform(request, authToken: authToken)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
