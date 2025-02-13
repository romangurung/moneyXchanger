//
//  CurrencyConverterViewModel.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/10/24.
//

import Foundation
import Observation

@Observable
class CurrencyConverterViewModel {
    var selectedCountry: Country = .unitedStates
    var convertedCountry: Country = .spain
    private var exchangeRateResponse: LatestExchangeRatesResponse?
    var enteredAmount: String = "0"
    var isSwapped: Bool = false {
        willSet {
            if newValue != isSwapped {  // Only swap if the value changes
                swapCountries()
            }
        }
    }

    private func swapCountries() {
        (selectedCountry, convertedCountry) = (convertedCountry, selectedCountry)
    }

    var convertedAmount: String {
        let convertedNumber = rateConversion * (Double(enteredAmount) ?? 0)
        if convertedNumber.truncatingRemainder(dividingBy: 1) == 0 {
            // Whole number, ignore decimals
            return String(format: "%.0f", convertedNumber)
        } else {
            // Retain the original string with 2 decimals
            return String(format: "%.2f", convertedNumber)
        }
    }

    var timeStamp: String {
        guard let date = exchangeRateResponse?.timestampDate else {
            return "N/A"
        }
        let formattedDate = date.formatted(date: .abbreviated, time: .shortened)
        return "\(formattedDate)"
    }

    var rateConversion: Double {
        let rate = exchangeRateResponse?.rates
        guard let selectedCountryRate = rate?.keyValuePairs[selectedCountry.currencyCode],
              let convertedCountryRate = rate?.keyValuePairs[convertedCountry.currencyCode] else {
            return 0
        }
        return (convertedCountryRate / selectedCountryRate)
    }

    private let openExchangeService: OpenExchangeRatesServiceable

    init(openExchangeService: OpenExchangeRatesServiceable) {
        self.openExchangeService = openExchangeService
    }

    func getLatestRates() async {
        do {
            exchangeRateResponse = try await openExchangeService.getLatestExchangeRates()
        } catch {
            exchangeRateResponse = nil
        }
    }
}
