//
//  CurrencyConverter.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/9/24.
//

import SwiftUI

struct CurrencyConverterView: View {
    @State private var viewModel = CurrencyConverterViewModel()

    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("\(Date().formatted(date: .abbreviated, time: .shortened))")
                    Text("1 USD = 0.92 EUR")
                }
            }
            CurrencyChangeButton(selectedCountry: viewModel.selectedCountry)
            Divider()
            CurrencyChangeButton(selectedCountry: viewModel.convertedCountry)
            KeypadView()
        }
    }
}

#Preview {
    CurrencyConverterView()
}
