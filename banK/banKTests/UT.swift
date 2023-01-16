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
    
    func breakDollarToCents() throws {
        let result = vc.breakIntoDollarsAndCents(5334.69)
        XCTAssertEqual(result.0, "5334,69")
        XCTAssertEqual(result.1, "12")
    }
    
    func dollarsFormatted() throws {
        let result = vc.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "$929,466.23")
    }
}
