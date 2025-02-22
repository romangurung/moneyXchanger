//
//  KeypadViewModelTests.swift
//  moneyXchangerTests
//
//  Created by Roman Gurung on 2/20/25.
//

import Testing
@testable import moneyXchanger

struct KeypadViewModelTests {

    let keypadViewModel = KeypadViewModel()

    @Test("Check swap button") func swap() async throws {
        keypadViewModel.didTap(button: .swap)
        #expect(keypadViewModel.isSwapped)
    }

    @Test("Check digits button", arguments: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])
    func digitButton(number: String) async throws {
        keypadViewModel.runningNumber = "123"
        keypadViewModel.didTap(button: KeypadButton(rawValue: number)!)
        #expect(keypadViewModel.runningNumber == "123\(number)")
    }

    @Test("Check decimal button without decimal point at the end of running number")
    func decimalButtonTappedWithoutDecimalInNumber() async throws {
        keypadViewModel.runningNumber = "123"
        keypadViewModel.didTap(button: .decimal)
        #expect(keypadViewModel.runningNumber == "123.")
    }

    @Test("Check decimal button with decimal point at the end of running number")
    func decimalButtonTappedWithDecimalAtEnd() async throws {
        keypadViewModel.runningNumber = "123."
        keypadViewModel.didTap(button: .decimal)
        #expect(keypadViewModel.runningNumber == "123.")
    }

    @Test("Check decimal button with math operators at the end of running number", arguments: ["+", "-", "x", "÷"])
    func decimalButtonTappedWithMathOperatorAtEnd(mathOperator: String) async throws {
        keypadViewModel.runningNumber = "123"
        keypadViewModel.runningNumber.append(mathOperator)
        keypadViewModel.didTap(button: .decimal)
        #expect(keypadViewModel.runningNumber == "123\(mathOperator)0.")
    }

    @Test("Check math operators button with math operator at the end of running number",
          arguments: ["+", "-", "x", "÷"])
    func mathOperatorButtonTappedWithMathOperatorAtEnd(mathOperator: String) async throws {
        keypadViewModel.runningNumber = "123+"
        keypadViewModel.didTap(button: KeypadButton(rawValue: mathOperator)!)
        #expect(keypadViewModel.runningNumber == "123\(mathOperator)")
    }

    @Test("Check math operators button without math operator at the end of running number",
          arguments: ["+", "-", "x", "÷"])
    func mathOperatorButtonTappedWithoutMathOperatorAtEnd(mathOperator: String) async throws {
        keypadViewModel.runningNumber = "123489"
        keypadViewModel.didTap(button: KeypadButton(rawValue: mathOperator)!)
        #expect(keypadViewModel.runningNumber == "123489\(mathOperator)")
    }

    @Test("Check clear button", arguments: ["1234", "123.056+25656", "123.056+25656x", "0"])
    func clearButtonTapped(input: String) async throws {
        keypadViewModel.runningNumber = input
        keypadViewModel.didTap(button: .clear)
        #expect(keypadViewModel.runningNumber == "0")
    }

    enum Input: String, CaseIterable {
        case inputOne = "12+45+10-9"
        case inputTwo = "12+45+10-1+"
        case inputThree = "12x45÷10-9"
        case inputFour = "12+45.89÷10-9.32"
        case inputFive = "12x45x10-9."
        case inputSix = "12+45x10-9342+78.34-123"
        case inputSeven = "0."
        case inputEight = "3478"

        var equal: String {
            switch self {
            case .inputOne: return "58"
            case .inputTwo: return "66"
            case .inputThree: return "45"
            case .inputFour: return "7.269"
            case .inputFive: return "5391"
            case .inputSix: return "-8924.66"
            case .inputSeven: return "0"
            case .inputEight: return "3478"
            }
        }

        var delete: String {
            switch self {
            case .inputOne: return "12+45+10-"
            case .inputTwo: return "12+45+10-1"
            case .inputThree: return "12x45÷10-"
            case .inputFour: return "12+45.89÷10-9.3"
            case .inputFive: return "12x45x10-9"
            case .inputSix: return "12+45x10-9342+78.34-12"
            case .inputSeven: return "0"
            case .inputEight: return "347"
            }
        }

        var percent: String {
            switch self {
            case .inputOne: return "12+45+10-0.09"
            case .inputTwo: return "12+45+10-0.01"
            case .inputThree: return "12x45÷10-0.09"
            case .inputFour: return "12+45.89÷10-0.0932"
            case .inputFive: return "12x45x10-0.09"
            case .inputSix: return "12+45x10-9342+78.34-1.23"
            case .inputSeven: return "0"
            case .inputEight: return "34.78"
            }
        }
    }

    @Test("Check equal button", arguments: Input.allCases)
    func equalButton(input: Input) async throws {
        keypadViewModel.runningNumber = input.rawValue
        keypadViewModel.didTap(button: .equal)
        #expect(keypadViewModel.runningNumber == input.equal)
    }

    @Test("Check delete button", arguments: Input.allCases)
    func deleteButton(input: Input) async throws {
        keypadViewModel.runningNumber = input.rawValue
        keypadViewModel.didTap(button: .delete)
        #expect(keypadViewModel.runningNumber == input.delete)
    }

    @Test("Check percent button", arguments: Input.allCases)
    func percentButton(input: Input) async throws {
        keypadViewModel.runningNumber = input.rawValue
        keypadViewModel.didTap(button: .percent)
        #expect(keypadViewModel.runningNumber == input.percent)
    }

}
