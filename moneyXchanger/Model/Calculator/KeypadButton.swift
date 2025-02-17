//
//  KeypadButton.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 3/12/24.
//

import SwiftUI

enum KeypadButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case delete = "DEL"
    case swap = "↑↓"

    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal: Color.orange
        case .clear, .delete, .swap: Color(.lightGray)
        default: Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }

    var buttonLabelSize: CGFloat {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal: 45
        case .decimal: 50
        default: 35
        }
    }
}

extension KeypadButton {
    var operation: Operation {
        switch self {
        case .add: .add
        case .subtract: .subtract
        case .multiply: .multiply
        case .divide: .divide
        case .swap: .swap
        default: .none
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, swap, none
}
