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
                Spacer()
                VStack {
                    let selectedCurrencyCode = viewModel.selectedCountry.currencyCode
                    let convertedCurrencyCode = viewModel.convertedCountry.currencyCode
                    let convertedAmount = viewModel.formattedRateConversion
                    Text("1 \(selectedCurrencyCode) = \(convertedAmount) \(convertedCurrencyCode)")
                    Text(viewModel.timeStamp)
                }
                .font(.system(size: 20, weight: .medium))
                Spacer()
                if viewModel.isFetchingLatestRates {
                    ProgressView()
                        .offset(x: -30)
                        .tint(.orange)
                        .scaleEffect(1.5)
                } else {
                    Button {
                        Task {
                            await viewModel.getLatestRates()
                        }
                    } label: {
                        Image(systemName: "arrow.trianglehead.clockwise")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.gray)
                    }
                    .offset(x: -30)
                }

            }
            Divider()
            CurrencyChangeButton(selectedCountry: $viewModel.selectedCountry, amount: viewModel.enteredAmount)
            Divider()
            CurrencyChangeButton(selectedCountry: $viewModel.convertedCountry, amount: viewModel.convertedAmount)
            Divider()
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
