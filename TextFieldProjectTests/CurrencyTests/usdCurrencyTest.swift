//
//  usdCurrencyTest.swift
//  TextFieldProjectTests
//
//  Created by Fabio Quintanilha on 4/19/20.
//  Copyright © 2020 TaskHackers. All rights reserved.
//

import XCTest
@testable import TextFieldProject

class usdCurrencyTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecoratorForUSD() {
        let decorator = CustomInputTextFieldDecorator(type: .currency(.USD(.en)))
        let valueDecorated = try? decorator.decorate(valueString: "1003.2998")
        XCTAssertEqual(valueDecorated, "$1,003.30")
    }
    
    func testDecoratorForUSDSpanish() {
        let decorator = CustomInputTextFieldDecorator(type: .currency(.USD(.es)))
        let valueDecorated = try? decorator.decorate(valueString: "1003.2998")
        XCTAssertEqual(valueDecorated, "$1003.30")
    }
    
    func testDecoratorForBRL() {
        let decorator = CustomInputTextFieldDecorator(type: .currency(.BRL(.pt)))
        let valueDecorated = try? decorator.decorate(valueString: "1003.2998")
        XCTAssertEqual(valueDecorated, "R$ 1.003,30")
    }
    
    func testDecoratorForGBP() {
        let decorator = CustomInputTextFieldDecorator(type: .currency(.GBP(.en)))
        let valueDecorated = try? decorator.decorate(valueString: "1003.2998")
        XCTAssertEqual(valueDecorated, "£1,003.30")
    }
    
    func testDecoratorForEuroFrench() {
        let decorator = CustomInputTextFieldDecorator(type: .currency(.EUR(.fr)))
        let valueDecorated = try? decorator.decorate(valueString: "1003.2998")
        XCTAssertEqual(valueDecorated, "1 003,30 €")
    }

    func testDecoratorForEuroEnglish() {
        let decorator = CustomInputTextFieldDecorator(type: .currency(.EUR(.en)))
        let valueDecorated = try? decorator.decorate(valueString: "1003.2998")
        XCTAssertEqual(valueDecorated, "€1 003,30")
    }
    
    func testDecoratorForLocal() {
        let decorator = CustomInputTextFieldDecorator(type: .currency(.Localized))
        let valueDecorated = try? decorator.decorate(valueString: "1003.2998")
        XCTAssertEqual(valueDecorated, "$1,003.30")
    }
}
