//
//  UT.swift
//  banKTests
//
//  Created by João Gabriel Lavareda Ayres Barreto on 16/01/23.
//
import Foundation
import XCTest

@testable import banK

class Test: XCTestCase {
    var vc: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        vc = CurrencyFormatter()
    }


//    func testDollarsFormatLocale() throws {
//        let locale = Locale.current
//        let currentSymbol = locale.currencySymbol!
//
//        let result = vc.dollarsFormatted(992893.23)
//        print("\(currentSymbol)")
//        XCTAssertEqual(result, "\(currentSymbol) 992.893,23")
//    }
}
