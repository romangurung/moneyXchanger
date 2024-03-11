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
    var rates: LatestExchangeRatesResponse?
}
