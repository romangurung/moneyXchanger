//
//  CurrencySelectionView.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/10/24.
//

import SwiftUI

struct CurrencySelectionView: View {

    @State private var viewModel = CurrencySelectionViewModel()
    @Binding var selectedCountry: Country
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.searchCountries, id: \.self) { country in
                    CurrencySelectionListCell(country: country)
                        .onTapGesture {
                            self.selectedCountry = country
                            dismiss()
                        }
                }
            }
        }
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    CurrencySelectionView(selectedCountry: .constant(.unitedStates))
}
