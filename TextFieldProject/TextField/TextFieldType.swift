//  Created by Fabio Quintanilha on 4/18/20.
//  Copyright © 2020 TaskHackers. All rights reserved.

import Foundation

enum TextFieldEntryError: Error {
    case invalidInput
    case unknown
    
    var description: String {
        switch self {
        case .invalidInput:
            return "The input entered is invalid"
        case .unknown:
            return localizedDescription
        }
    }
}

protocol TextFieldTypeProtocol {
    var decoratorCharacter: String { get }
}

extension TextFieldTypeProtocol {
    var decoratorCharacter: String {
        return ""
    }
}

enum TextFieldType {
    case currency(Currencies)
    case percentage
    case email
    case password
    case custom
}

class CustomInputTextFieldDecorator {
    private var type: TextFieldType!
    
    init(type: TextFieldType) {
        self.type = type
    }
    
    func decorate(character: String?) throws -> String {
        switch self.type {
        case .currency(let currencyType):
            var currency = Currency(type: currencyType)
            return try currency.decorate(digitChar: character)
        case .percentage:
            self.setPercentage()
            return ""
        case .email:
            self.setEmail()
            return ""
        case .password:
            self.setPassword()
            return ""
        default:
            return ""
        }
    }
    
    var maxValue: Int{
        switch self.type {
        case .currency:
            return Currency.maxValue
        case .percentage:
            return 3
        case .email:
            self.setEmail()
            return 256
        case .password:
            self.setPassword()
            return 100
        default:
            return 256
        }
    }
    
    private func setPercentage() {
       
    }
    
    private func setEmail() {
        
    }
    
    private func setPassword() {
        
    }
    
}
