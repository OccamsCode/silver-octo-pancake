//
//  Double+Extension.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation

extension Double {
    
    private var currenyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var percentageFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }

    
    var asCurrency: String {
        return currenyFormatter.string(for: self) ?? "N/A"
    }
    
    var asPercentage: String {
        return percentageFormatter.string(for: self / 100) ?? "N/A"
    }
    
    var asShorthand: String {
        
        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "K"),
                                           (100_000.0, 1_000_000.0, "M"),
                                           (1_000_000_000.0, 1_000_000_000.0, "B")]

        let startValue = Double (abs(self))
        let abbreviation:Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()
        
        let formatter = currenyFormatter
        formatter.positiveSuffix = abbreviation.suffix
        formatter.negativeSuffix = abbreviation.suffix
        formatter.allowsFloats = true
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        
        return formatter.string(for: self / abbreviation.divisor) ?? "N/A"
    }
}
