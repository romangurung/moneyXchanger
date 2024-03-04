//
//  NetworkError.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/3/24.
//

import Foundation

enum NetworkError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case requestFailed
    case serverError
    case unknown

    var errorDescription: String {
        switch self {
        case .decode:
            "Decode error"
        case .unauthorized:
            "Session expired"
        case .requestFailed:
            "Request failed"
        case .serverError:
            "Server error"
        default:
            "Unknown error"
        }
    }
}
