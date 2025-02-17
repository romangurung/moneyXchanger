//
//  CurrencyChangeButton.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/5/24.
//

import SwiftUI

struct CurrencyChangeButton: View {
    @Binding var selectedCountry: Country
    @State private var isShowingSheet = false
    var amount: String

    var body: some View {
        Button {
            isShowingSheet.toggle()
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Image(selectedCountry.countryCode)
                        .resizable()
                        .frame(width: 50, height: 30)
                    Text(selectedCountry.currencyCode)
                        .font(.system(size: 25))
                }
                Spacer()
                Text(amount)
                    .bold()
                    .font(.system(size: 35))
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
    CurrencyChangeButton(selectedCountry: .constant(.unitedStates), amount: "123.0")
}
