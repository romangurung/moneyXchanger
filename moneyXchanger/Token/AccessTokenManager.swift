//
//  AccessTokenManager.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/3/24.
//

import Foundation

protocol AccessTokenManagerProtocol {
    func isTokenValid() -> Bool
    func fetchToken() -> String
    func refreshWith(apiToken: APIToken) throws
}

class AccessTokenManager {
    private let userDefaults: UserDefaults
    private var accessToken: String?
    private var expiresAt = Date()

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        update()
    }
}

// MARK: - AccessTokenManagerProtocol
extension AccessTokenManager: AccessTokenManagerProtocol {
    func isTokenValid() -> Bool {
        update()
        return accessToken != nil && expiresAt.compare(Date()) == .orderedDescending
    }

    func fetchToken() -> String {
        guard let token = accessToken else {
            return ""
        }
        return token
    }

    func refreshWith(apiToken: APIToken) throws {
        let expiresAt = apiToken.expiresAt
        let token = apiToken.bearerAccessToken

        save(token: apiToken)
        self.expiresAt = expiresAt
        self.accessToken = token
    }
}

// MARK: - Token Expiration
private extension AccessTokenManager {
    private func save(token: APIToken) {
        userDefaults.set(token.expiresAt.timeIntervalSince1970, forKey: AppUserDefaultsKeys.expiresAt)
        userDefaults.set(token.bearerAccessToken, forKey: AppUserDefaultsKeys.bearerAccessToken)
    }

    private func getExpirationDate() -> Date {
        Date(timeIntervalSince1970: userDefaults.double(forKey: AppUserDefaultsKeys.expiresAt))
    }

    private func getToken() -> String? {
        userDefaults.string(forKey: AppUserDefaultsKeys.bearerAccessToken)
    }

    private func update() {
        accessToken = getToken()
        expiresAt = getExpirationDate()
    }
}
