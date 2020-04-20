//  Created by Fabio Quintanilha on 4/18/20.
//  Copyright © 2020 TaskHackers. All rights reserved.

import Foundation



struct Currency: TextFieldTypeProtocol {
    
    static var amount: Int64 = 0
    static let maxValue = 20
    private var currencyType: Currencies!
    private var stringInput: String!
    private var value: Double?
    
    init(type: Currencies) {
        self.currencyType = type
    }
    
    mutating func decorate(digitChar: String?) throws -> String {
        if let char = digitChar, let digit = Int64(char) {
            Currency.amount = (Currency.amount * 10) + digit
        }
            
        if digitChar == "" {
            Currency.amount = Currency.amount / 10
        }
        
        guard let value = getNumeralValue(amount: Currency.amount, currencyType: currencyType) else {
            throw TextFieldEntryError.invalidInput
        }
        self.value = value
        return self.currencyType.format(value: value)
    }
    
    private func getNumeralValue(amount: Int64, currencyType: Currencies) -> Double? {
       return CustomNumberFormatter.currency(value: amount).formattedValue
    }
       
    private func getNumeralValue(text: String, currencyType: Currencies) -> Double? {
        guard let string = stringByRemovingCharacters(text),
            let numeral = Int64(string) else {
            return nil
        }
        
        return CustomNumberFormatter.currency(value: numeral).formattedValue
    }
    
    private func stringByRemovingCharacters(_ string: String) -> String? {
       let pattern = "[^0-9.]"
       do {
           let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
           
           let numberString = regex.stringByReplacingMatches(in: string, options: NSRegularExpression.MatchingOptions.withTransparentBounds, range: NSMakeRange(0, string.count), withTemplate: "")
           return numberString
       } catch {
           return nil
       }
    }
}
 
