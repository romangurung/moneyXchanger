//
//  Double+Extension.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 2/13/25.
//
import Foundation

extension Double {
    var decimalOptimizedString: String {
        if self == floor(self) {
            return String(format: "%.0f", self)  // No decimal part, show as integer
        } else if self < 0.01 {
            return String(format: "%.5g", self)  // Show last 2 significant decimal digits
        } else {
            return String(format: "%.2f", self)  // Show 2 decimal places
        }
    }
}
