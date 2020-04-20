//  Created by Fabio Quintanilha on 4/19/20.
//  Copyright © 2020 TaskHackers. All rights reserved.

import Foundation

enum CustomNumberFormatter {
    case currency(value: Int64)
    case percentage(value: Double)
    case decimalPercentage(value: Double)
    case decimal(value: Double)
    case scientific(value: Double)
    
    private enum NumberOfDecimals {
        case zerodigits
        case oneDigit
        case twoDigits
        case threeDigits
        case fourDigits
        case unknown
        
        private var numberOfDigits: Int {
            switch self {
            case .zerodigits:
                return 0
            case .oneDigit:
                return 1
            case .twoDigits, .unknown:
                return 2
            case .threeDigits:
                return 3
            case .fourDigits:
                return 4
            }
        }
        
        func format(value: Int64) -> Double {
            let amount = Double(value / 100) + Double(value % 100) / 100
            return amount
        }
        
        func format(value: Double) -> Double {
            let digits = pow(10, Double(self.numberOfDigits))
            return Double(round(digits * value) / digits)
        }
    }
    
    var formattedValue : Double {
        switch self {
        case .currency(let value):
             return NumberOfDecimals.twoDigits.format(value: value)
        case .decimal(let value):
            return NumberOfDecimals.twoDigits.format(value: value)
        case .percentage(let value):
            return NumberOfDecimals.zerodigits.format(value: value)
        case .decimalPercentage(let value):
            return NumberOfDecimals.oneDigit.format(value: value)
        case .scientific(let value):
            return NumberOfDecimals.twoDigits.format(value: value)
        }
    }
}
