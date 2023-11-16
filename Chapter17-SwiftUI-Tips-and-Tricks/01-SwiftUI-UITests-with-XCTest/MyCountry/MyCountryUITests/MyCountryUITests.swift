//
//  MyCountryUITests.swift
//  MyCountryUITests
//
//  Created by Juan Catalan on 10/14/23.
//

import XCTest

final class MyCountryUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testButtonLabels() throws {
        let expectedLabels = ["US": "USA", "SP" : "Spain", "FR": "France", "IT": "Italy", "Reset": "Reset"]
        let identifiers = expectedLabels.keys
        for identifier in identifiers {
            let expectedLabel = expectedLabels[identifier]!
            let button = app.buttons[identifier]
            let label = button.label
            XCTAssertEqual(expectedLabel, label, "Button '\(expectedLabel)' not present")
        }
    }
    
    func testTextLabels() throws {
        let expectedLabels = ["Question": "What is your country of origin?", "SelectedCountry": "USA", "NumberOfTaps": "Number of taps: 0"]
        let identifiers = expectedLabels.keys
        for identifier in identifiers {
            let expectedLabel = expectedLabels[identifier]!
            let text = app.staticTexts[identifier]
            let label = text.label
            XCTAssertEqual(expectedLabel, label, " Text '\(expectedLabel)' not present")
        }
    }
    
    func testCountryButtonAction() throws {
        var counter = 0
        let identifiers = ["SP", "FR", "IT", "US"]
        for identifier in identifiers {
            let button = app.buttons[identifier]
            button.tap()
            counter += 1
            XCTAssertEqual(app.staticTexts["SelectedCountry"].label, button.label)
            XCTAssertEqual(app.staticTexts["NumberOfTaps"].label, "Number of taps: \(counter)")
        }
    }
    
    func testResetButtonAction() throws {
        app.buttons["Spain"].tap()
        app.buttons["Spain"].tap()
        XCTAssertEqual(app.staticTexts["SelectedCountry"].label, "Spain")
        XCTAssertEqual(app.staticTexts["NumberOfTaps"].label, "Number of taps: 2")
        app.buttons["Reset"].tap()
        XCTAssertEqual(app.staticTexts["SelectedCountry"].label, "USA")
        XCTAssertEqual(app.staticTexts["NumberOfTaps"].label, "Number of taps: 0")
    }
}
