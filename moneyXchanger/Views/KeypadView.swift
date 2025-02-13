//
//  KeypadView.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/12/24.
//

import SwiftUI

struct KeypadView: View {

    private let buttons: [[KeypadButton]] = [
        [.clear, .delete, .swap, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .percent, .equal]
    ]

    @State private var viewModel = KeypadViewModel()
    @Binding var amount: String
    @Binding var isSwapped: Bool

    var body: some View {
        ForEach(buttons, id: \.self) {row in
            HStack(spacing: 12) {
                ForEach(row, id: \.self) { item in
                    Button(action: {
                        self.viewModel.didTap(button: item)
                        amount = self.viewModel.runningNumber
                        isSwapped = self.viewModel.isSwapped
                    }, label: {
                        Text(item.rawValue)
                            .font(.system(size: 32))
                            .frame(
                                width: self.buttonDiameter(),
                                height: self.buttonDiameter()
                            )
                            .background(
                                Circle()
                                    .fill(item.buttonColor)
                            )
                            .foregroundColor(.white)
                    })
                }
            }
            .padding(.bottom, 3)
        }
    }

    private func buttonDiameter() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

#Preview {
    KeypadView(amount: .constant("98"), isSwapped: .constant(false))
}
