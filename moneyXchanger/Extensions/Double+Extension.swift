//
//  Double+Extension.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 2/13/25.
//

extension Double {
    var decimalOptimizedString: String {
        self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.2f", self)
    }
}
