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
    case notConnectedToInternet
    case timedOut
    case badServerResponse
    case cannotFindHost
    case cannotConnectToHost
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
        case .notConnectedToInternet:
            "No internet connection"
        case .timedOut:
            "Request timed out"
        case .badServerResponse:
            "Bad server response"
        case .cannotFindHost:
            "Cannot find host"
        case .cannotConnectToHost:
            "Cannot connect to host"
        default:
            "Unknown error"
        }
    }
}

