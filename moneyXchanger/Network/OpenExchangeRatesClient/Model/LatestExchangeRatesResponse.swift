//
//  LatestExchangeRatesResponse.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/4/24.
//

import Foundation

struct LatestExchangeRatesResponse: Decodable {
    let disclaimer: String
    let license: String
    let timestamp: String
    let base: String
    let rates: Rates
}

struct Rates: Decodable {
    let keyValuePairs: [String: Double]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        var keyValuePairs = [String: Double]()

        for key in container.allKeys {
            if let value = try? container.decode(Double.self, forKey: key) {
                keyValuePairs[key.stringValue] = value
            }
        }
        self.keyValuePairs = keyValuePairs
    }

    private struct DynamicCodingKeys: CodingKey {
        var stringValue: String

        var intValue: Int? {
            return nil
        }

        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        init?(intValue: Int) {
            return nil
        }
    }
}
