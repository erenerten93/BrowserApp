//
//  FactoryTests.swift
//  BrowserAppTests
//
//  Created by Eren Erten on 19.07.2023.
//
import XCTest
@testable import BrowserApp

class FactoryTests: XCTestCase {

    func testMakeLabel() {
        let label = makeLabel(withText: "Test Label")
        
        XCTAssertEqual(label.text, "Test Label")
        XCTAssertEqual(label.textAlignment, .center)
        XCTAssertEqual(label.numberOfLines, 0)
        XCTAssertEqual(label.textColor, .lightGray)
        XCTAssertEqual(label.minimumScaleFactor, 0.2, accuracy: 0.0001)
    }

    func testMakeStackView() {
        let stackView = makeStackView(withOrientation: .vertical, distribution: .fill)
        
        XCTAssertEqual(stackView.axis, .vertical)
        XCTAssertEqual(stackView.distribution, .fill)
        XCTAssertEqual(stackView.alignment, .center)
        XCTAssertEqual(stackView.spacing, 10.0)
    }

}
