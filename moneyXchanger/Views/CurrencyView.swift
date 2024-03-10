//
//  CurrencyView.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/5/24.
//

import SwiftUI

struct CurrencyView: View {
    @State private var amount = 788.00000009899


    var body: some View {

        HStack {
            CurrencyChangeButton()
            Spacer()
            Text(amount, format: .currency(code: "SAR"))
                .lineLimit(1)
        }
        .padding(.leading)
        .padding(.trailing)



    }
}

#Preview {
    CurrencyView()
}
