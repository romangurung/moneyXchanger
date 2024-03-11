//
//  CurrencySelectionViewModel.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/10/24.
//

import Foundation
import Observation

@Observable
class CurrencySelectionViewModel {
    var searchText = ""
    var countries: [Country] = Country.allCases

    var searchCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { $0.currencyName.contains(searchText) }
        }
    }
}
