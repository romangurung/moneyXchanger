//
//  OpenExchangeRatesProvider.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/3/24.
//

import Foundation

enum OpenExchangeRatesProvider: RequestProtocol {

    case getLatestExchangeRate

    var path: String {
        "/api/latest.json"
    }

    var method: RequestMethod {
        .get
    }

    var headers: [String: String]? {
        nil
    }

    var body: [String: Any]? {
        nil
    }

    var urlParams: [String: String]? {
        guard let appID = Bundle.main.infoDictionary?["APP_ID"] as? String else {
            return nil
        }
        return ["app_id": appID]
    }

    var addAuthorizationToken: Bool {
        false
    }
}
