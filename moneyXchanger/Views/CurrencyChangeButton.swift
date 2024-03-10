//
//  CurrencyChangeButton.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/5/24.
//

import SwiftUI

struct CurrencyChangeButton: View {
    @State private var imageName: String = "BR"

    var body: some View {
        Button {

        } label: {
            VStack(alignment: .leading) {
                Image(imageName)
                    .resizable()
                    .frame(width: 30, height: 20)
                Text("NPR")
                    .font(.system(size: 16))
            }
        }
    }
}

#Preview {
    CurrencyChangeButton()
}
