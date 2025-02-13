//
//  String+Extension.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 2/12/25.
//

extension String {

    var containsDecimalWithTwoDigits: Bool {
        let regex = "\\.\\d{2}" // Matches a decimal point followed by exactly 2 digits
        return self.range(of: regex, options: .regularExpression) != nil
    }
}
