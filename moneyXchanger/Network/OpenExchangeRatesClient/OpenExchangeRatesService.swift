//
//  OpenExchangeRatesService.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/3/24.
//

import Foundation

protocol OpenExchangeRatesServiceable {
    func getLatestExchangeRates() async throws -> LatestExchangeRatesResponse
}

struct OpenExchangeRatesService: OpenExchangeRatesServiceable {
    func getLatestExchangeRates() async throws -> LatestExchangeRatesResponse {
        let request = OpenExchangeRatesProvider.getLatestExchangeRate
        let requestManager = RequestManager()
        do {
            let response: LatestExchangeRatesResponse = try await requestManager.perform(request)
            return response
        } catch {
            throw NetworkError.decode
        }
    }
}
