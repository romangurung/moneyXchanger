//
//  CurrencyChangeButton.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/5/24.
//

import SwiftUI

struct CurrencyChangeButton: View {
    @State var selectedCountry: Country
    @State private var isShowingSheet = false

    var body: some View {
        Button {
            isShowingSheet.toggle()
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Image(selectedCountry.countryCode)
                        .resizable()
                        .frame(width: 30, height: 20)
                    Text(selectedCountry.currencyCode)
                        .font(.system(size: 16))
                }
                Spacer()
                Text(1234, format: .currency(code: "SAR"))
                    .bold()
                    .font(.title3)
                    .lineLimit(1)
            }
            .padding(.all)
        }
        .sheet(isPresented: $isShowingSheet) {
            CurrencySelectionView(selectedCountry: $selectedCountry)
        }
    }
}

#Preview {
    CurrencyChangeButton(selectedCountry: .unitedStates)
}
