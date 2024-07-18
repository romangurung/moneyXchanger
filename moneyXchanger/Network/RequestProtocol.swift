//
//  RequestProtocol.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/3/24.
//

import Foundation

protocol RequestProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var headers: [String: String]? { get }
    var body: [String: Any]? { get }
    var urlParams: [String: String]? { get }
    var addAuthorizationToken: Bool { get }
}

extension RequestProtocol {
    var scheme: String { "https" }
    var host: String { "openexchangerates.org" }
    var urlParams: [String: String]? { nil }
}

extension RequestProtocol {
    func createURLRequest(authToken: String) throws -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path

        if let urlParams {
            components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        }

        guard let url = components.url else { throw  NetworkError.invalidURL }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        if let headers, !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }

        if addAuthorizationToken {
          urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
        }

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let body, !body.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body)
        }

        return urlRequest
    }
}
