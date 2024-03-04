//
//  APIToken.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/3/24.
//

import Foundation

struct APIToken {
    let tokenType: String
    let expiresIn: Int
    let accessToken: String
    private let requestedAt = Date()
}

// MARK: - Codable
extension APIToken: Codable {
    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
    }
}

// MARK: - Helper properties
extension APIToken {
    var expiresAt: Date {
        Calendar.current.date(byAdding: .second, value: expiresIn, to: requestedAt) ?? Date()
    }

    var bearerAccessToken: String {
        "\(tokenType) \(accessToken)"
    }
}
