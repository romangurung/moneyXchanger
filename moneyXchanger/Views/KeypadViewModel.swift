//
//  KeypadViewModel.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/19/24.
//

import Foundation

@Observable
class KeypadViewModel {

    // Expression entered by the user
    var runningNumber = "0"
    var isSwapped = false

    func didTap(button: KeypadButton) {
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            handleDigitsButtonTapped(button: button)
        case .decimal:
            handleDecimalButtonTapped()
        case .add, .subtract, .multiply, .divide:
            if runningNumber.isLastCharacterMathOperator {
                runningNumber.removeLast()
                runningNumber += button.rawValue
            } else {
                runningNumber += button.rawValue
            }
        case .equal:
            runningNumber = evaluateExpression(runningNumber)
        case .clear:
            runningNumber = "0"
        case .percent:
            let runningValue = Double(runningNumber) ?? 0
            runningNumber = (runningValue / 100).decimalOptimizedString
        case .swap:
            isSwapped.toggle()
        case .delete:
            deleteLastCharacter()
        }
    }

    private func handleDecimalButtonTapped() {
        if runningNumber.contains(KeypadButton.decimal.rawValue) {

        } else {
            runningNumber += KeypadButton.decimal.rawValue
        }
    }

    private func handleDigitsButtonTapped(button: KeypadButton) {
        let number = button.rawValue
        if runningNumber == "0" {
            runningNumber = number
        } else if !runningNumber.containsDecimalWithTwoDigits {
            runningNumber += number
        }
    }

    private func deleteLastCharacter() {
        if runningNumber.count > 1 {
            runningNumber.removeLast()
        } else if runningNumber.count == 1 {
            runningNumber = "0"
        }
    }

    func evaluateExpression(_ expression: String) -> String {
        let exp = NSExpression(format: expression)

        if let result = exp.expressionValue(with: nil, context: nil) as? Double {
            return "\(result)"
        }
        return "-"
    }
}

extension String {
    var isLastCharacterMathOperator: Bool {
        self.last == "+" || self.last == "-" || self.last == "x" || self.last == "/"
    }
}
