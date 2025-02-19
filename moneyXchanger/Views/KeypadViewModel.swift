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
            if runningNumber.endsWithMathOperator {
                runningNumber.removeLast()
            }
            runningNumber += button.rawValue
        case .equal:
            runningNumber = evaluateExpression(runningNumber)
        case .clear:
            runningNumber = "0"
        case .percent:
            handlePercentButtonTapped()
        case .swap:
            isSwapped.toggle()
        case .delete:
            deleteLastCharacter()
        }
    }

    private func handleDecimalButtonTapped() {
        if runningNumber.last == "." { return }
        guard let lastNumber = extractLastNumber(from: runningNumber) else {
            runningNumber.append("0.")
            return
        }
        if !lastNumber.contains(KeypadButton.decimal.rawValue) {
            runningNumber.append(".")
        }
    }

    private func handleDigitsButtonTapped(button: KeypadButton) {
        let number = button.rawValue
        if runningNumber == "0" {
            runningNumber = number
        } else if runningNumber.endsWithMathOperator {
            runningNumber += number
        } else if let lastNumber = extractLastNumber(from: runningNumber), !lastNumber.containsDecimalWithTwoDigits {
            runningNumber += number
        }
    }

    private func handlePercentButtonTapped() {
        let pattern = #"[-+]?\d*\.?\d+$"#  // Find the last number (supports decimals)

        guard let range = runningNumber.range(of: pattern, options: .regularExpression),
              let lastNumber = Double(runningNumber[range]) else {
            return  // Return original if no number found
        }

        let percentageValue = lastNumber / 100  // Convert to percentage
        runningNumber = runningNumber.replacingCharacters(in: range, with: "\(percentageValue)")
    }

    private func deleteLastCharacter() {
        if runningNumber.count > 1 {
            runningNumber.removeLast()
        } else if runningNumber.count == 1 {
            runningNumber = "0"
        }
    }

    private func evaluateExpression(_ expression: String) -> String {
        var expression = expression
        if expression.endsWithMathOperator {
            expression.removeLast()
        }
        let trimmedExpression = expression.replacingOccurrences(of: ["x": "*", "÷": "/"])
        let exp = NSExpression(format: trimmedExpression)

        if let result = exp.expressionValue(with: nil, context: nil) as? Double {
            return formatNumber(result)
        }
        return "-"
    }

    private func extractLastNumber(from expression: String) -> String? {
        // Matches the last number (supports decimals)
        let pattern = #"[-+]?\d*\.?\d+$"#

        if let range = expression.range(of: pattern, options: .regularExpression) {
            return String(expression[range])
        }
        return nil
    }

    func formatNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 10  // Adjust precision as needed
        formatter.usesGroupingSeparator = false  // No commas in numbers
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}

private extension String {
    var endsWithMathOperator: Bool {  // More natural naming
        guard let lastCharacter = self.last else { return false }
        let mathOperators: Set<Character> = ["+", "-", "x", "÷", "."]
        return mathOperators.contains(lastCharacter)
    }
}
