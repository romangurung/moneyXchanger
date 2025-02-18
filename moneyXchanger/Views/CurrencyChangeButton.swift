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
        HStack {
            Button {
                isShowingSheet.toggle()
            } label: {
                VStack(alignment: .leading) {
                    Image(selectedCountry.countryCode)
                        .resizable()
                        .frame(width: 50, height: 30)
                    Text(selectedCountry.currencyCode)
                        .font(.system(size: 25))
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                CurrencySelectionView(selectedCountry: $selectedCountry)
            }
            Spacer()
            Text(amount)
                .bold()
                .font(.system(size: 35))
                .foregroundColor(.blue)
                .lineLimit(1)
        }
        .padding(.all)
    }
}

#Preview {
    CurrencyChangeButton(selectedCountry: .constant(.unitedStates), amount: "123.0")
}
