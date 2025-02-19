//
//  String+Extension.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 2/12/25.
//

extension String {

    var containsDecimalWithTwoDigits: Bool {
        // Matches a decimal point followed by exactly 2 digits
        let regex = "\\.\\d{2}"
        return self.range(of: regex, options: .regularExpression) != nil
    }

    func replacingOccurrences(of replacements: [String: String]) -> String {
        return replacements.reduce(self) { result, pair in
            result.replacingOccurrences(of: pair.key, with: pair.value)
        }
    }
}
