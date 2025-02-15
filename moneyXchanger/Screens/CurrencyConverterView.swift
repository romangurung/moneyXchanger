//
//  CurrencyConverter.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/9/24.
//

import SwiftUI

struct CurrencyConverterView: View {
    @State private var viewModel = CurrencyConverterViewModel(openExchangeService: OpenExchangeRatesService())

    var body: some View {
        VStack {
            HStack {
                VStack {
                    let selectedCurrencyCode = viewModel.selectedCountry.currencyCode
                    let convertedCurrencyCode = viewModel.convertedCountry.currencyCode
                    let convertedAmount = viewModel.formattedRateConversion
                    Text("1 \(selectedCurrencyCode) = \(convertedAmount) \(convertedCurrencyCode)")
                    Text(viewModel.timeStamp)
                }
            }
            CurrencyChangeButton(selectedCountry: $viewModel.selectedCountry, amount: viewModel.enteredAmount)
            Divider()
            CurrencyChangeButton(selectedCountry: $viewModel.convertedCountry, amount: viewModel.convertedAmount)
            KeypadView(amount: $viewModel.enteredAmount, isSwapped: $viewModel.isSwapped)
        }
        .task {
            await viewModel.getLatestRates()
        }
    }
}

#Preview {
    CurrencyConverterView()
}
