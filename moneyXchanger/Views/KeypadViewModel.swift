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
    @ObservationIgnored
    private var finalValue = "0"

    @ObservationIgnored
    private var currentOperation: Operation = .none

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
            if currentOperation == .none {
                finalValue = runningNumber
            }
            runningNumber = "0"
            currentOperation = button.operation
        case .equal:
            handleEqualOperator()
        case .clear:
            runningNumber = "0"
            finalValue = "0"
            currentOperation = .none
        case .percent:
            break
        case .swap:
            isSwapped = !isSwapped
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
        } else if runningNumber.containsDecimalWithTwoDigits {

        } else {
            runningNumber += number
        }
    }

    private func handleEqualOperator() {
        let previousValue = Double(finalValue) ?? 0
        let runningValue = Double(runningNumber) ?? 0
        switch self.currentOperation {
        case .add:
            finalValue = (previousValue + runningValue).decimalOptimizedString
            runningNumber = finalValue
        case .subtract:
            finalValue = (previousValue - runningValue).decimalOptimizedString
            runningNumber = finalValue
        case .multiply:
            finalValue = (previousValue * runningValue).decimalOptimizedString
            runningNumber = finalValue
        case .divide:
            finalValue = (previousValue / runningValue).decimalOptimizedString
            runningNumber = finalValue
        default:
            break
        }
        currentOperation = .none
    }

    private func deleteLastCharacter() {
        if runningNumber.count > 1 {
            runningNumber.removeLast()
        } else if runningNumber.count == 1 {
            runningNumber = "0"
        }
    }
}
