//
//  CurrencyChangeButton.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/5/24.
//

import SwiftUI
import FlagKit

struct CurrencyChangeButton: View {
    @Binding var countryCode: String

    var body: some View {
        Button {

        } label: {
            VStack(alignment: .leading) {
                let flag = Flag(countryCode: countryCode)
                Image(uiImage: flag?.originalImage ?? UIImage())
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("ADD")
                    .font(.system(size: 16))
            }
        }
    }
}

#Preview {
    CurrencyChangeButton(countryCode: .constant("NP"))
}
