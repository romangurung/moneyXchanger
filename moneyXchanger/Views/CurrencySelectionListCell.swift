//
//  CurrencySelectionListCell.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/10/24.
//

import SwiftUI

struct CurrencySelectionListCell: View {
    let country: Country

    var body: some View {
        HStack {
            Image(country.countryCode)
            Text(country.currencyName)
            Spacer()
            Text(country.currencyCode)
        }
        .font(.body)
        .padding()
    }
}

#Preview {
    CurrencySelectionListCell(country: .unitedStates)
}
