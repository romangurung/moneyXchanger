//
//  NetworkManager.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/3/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func perform(_ request: RequestProtocol, authToken: String?) async throws -> Data
    func requestToken() async throws -> Data
}

class NetworkManager: NetworkManagerProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func perform(_ request: RequestProtocol, authToken: String? = nil) async throws -> Data {
        do {
            let (data, response) = try await urlSession.data(for: request.createURLRequest(authToken: authToken))
            return try handleHTTPResponse(data, response)
        } catch let urlError as URLError {
            throw handleHTTPError(urlError)
        } catch {
            throw NetworkError.unknown
        }
    }

    private func handleHTTPResponse(_ data: Data, _ response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.badServerResponse
        }
        switch httpResponse.statusCode {
        case 200..<300:
            return data
        case 401:
            throw NetworkError.unauthorized
        case 500..<600:
            throw NetworkError.serverError
        default:
            throw NetworkError.unknown
        }
    }

    private func handleHTTPError(_ urlError: URLError) -> Error {
        switch urlError.code {
        case .notConnectedToInternet:
            NetworkError.notConnectedToInternet
        case .timedOut:
            NetworkError.timedOut
        case .badServerResponse:
            NetworkError.badServerResponse
        case .cannotFindHost:
            NetworkError.cannotFindHost
        case .cannotConnectToHost:
            NetworkError.cannotConnectToHost
        default:
            NetworkError.unknown
        }
    }

    func requestToken() async throws -> Data {
        try await perform(AuthTokenRequest.auth)
    }
}
