//
//  test.swift
//  banKTests
//
//  Created by João Gabriel Lavareda Ayres Barreto on 16/01/23.
//

import XCTest

@testable import banK

final class test: XCTestCase {
    
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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
