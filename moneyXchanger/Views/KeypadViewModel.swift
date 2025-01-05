//
//  KeypadViewModel.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/19/24.
//

import Foundation

@Observable
class KeypadViewModel {

    // Final calculated value
    var finalValue = "0"

    // Expression entered by the user
    var runningNumber = "0"
    var currentOperation: Operation = .none

    func didTap(button: KeypadButton) {
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            let number = button.rawValue
            if runningNumber == "0" {
                runningNumber = number
            } else if runningNumber.containsDecimalWithTwoDigits {
                break
            } else {
                runningNumber += number
            }
        case .decimal:
            if runningNumber.contains(KeypadButton.decimal.rawValue) {
                break
            } else {
                runningNumber += KeypadButton.decimal.rawValue
            }
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = finalValue
            } else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = finalValue
            } else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = finalValue
            } else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = finalValue
            } else if button == .equal {
                let runningValue = Double(runningNumber) ?? 0
                let currentValue = Double(finalValue) ?? 0
                switch self.currentOperation {
                case .add: finalValue = "\(runningValue + currentValue)"
                case .subtract: finalValue = "\(runningValue - currentValue)"
                case .multiply: finalValue = "\(runningValue * currentValue)"
                case .divide: finalValue = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
        case .clear:
            runningNumber = "0"
        case .percent:
            break
        case .swap:
            break
        case .delete:
            deleteLastCharacter()
        }
    }

    private func deleteLastCharacter() {
        if runningNumber.count > 1 {
            runningNumber.removeLast()
        } else if runningNumber.count == 1 {
            runningNumber = "0"
        }
    }
}

extension String {

    var containsDecimalWithTwoDigits: Bool {
        let regex = "\\.\\d{2}" // Matches a decimal point followed by exactly 2 digits
        return self.range(of: regex, options: .regularExpression) != nil
    }
}
