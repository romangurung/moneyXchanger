//
//  AuthTokenRequest.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/3/24.
//

import Foundation

enum AuthTokenRequest: RequestProtocol {

    case auth

    var host: String {
        "apigee.com"
    }

    var path: String {
        "/v2/oauth2/token"
    }

    var method: RequestMethod {
        .post
    }

    var headers: [String: String]? { nil }

    var body: [String: Any]? {
        [
            "grant_type": "APIConstants.grantType",
            "client_id": "APIConstants.clientId",
            "client_secret": "APIConstants.clientSecret"
        ]
    }

    var addAuthorizationToken: Bool {
        false
    }
}
