//
//  ProfileTests.swift
//  banKTests
//
//  Created by João Gabriel Lavareda Ayres Barreto on 20/01/23.
//

import Foundation
import XCTest

@testable import banK

class ProfileTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
        {
        "id": "1",
        "first_name": "Kevin",
        "last_name": "Flynn",
        }
        """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Profile.self, from: data)
        
        XCTAssertEqual(result.id, "1")
        XCTAssertEqual(result.firstName, "Kevin")
        XCTAssertEqual(result.lastName, "Flynn")
    }
}
