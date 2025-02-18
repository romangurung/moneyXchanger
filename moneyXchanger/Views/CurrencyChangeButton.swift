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
    @Binding var scrollToEnd: Bool

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

            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { proxy in
                        HStack {
                            Text(amount)
                                .bold()
                                .font(.system(size: 35))
                                .foregroundColor(.blue)
                                .lineLimit(1)
                                .frame(minWidth: geometry.size.width, maxWidth: .infinity, alignment: .trailing)
                                .id("End")
                        }
                        .onChange(of: scrollToEnd) {
                            scrollToEnd(proxy: proxy)
                        }
                    }
                }
            }
            .frame(height: 60)
        }
        .padding(.all)
    }

    // Scroll function
    private func scrollToEnd(proxy: ScrollViewProxy) {
        withAnimation {
            proxy.scrollTo("End", anchor: .trailing) // Scroll to last item
        }
    }
}

#Preview {
    CurrencyChangeButton(selectedCountry: .constant(.unitedStates), amount: "123.0", scrollToEnd: .constant(false))
}
