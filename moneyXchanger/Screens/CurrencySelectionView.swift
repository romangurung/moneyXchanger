//
//  CurrencySelectionView.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/10/24.
//

import SwiftUI

struct CurrencySelectionView: View {

    @State private var viewModel = CurrencySelectionViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.searchCountries, id: \.self) { country in
                    CurrencySelectionListCell(country: country)
                }
            }
        }
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    CurrencySelectionView()
}
