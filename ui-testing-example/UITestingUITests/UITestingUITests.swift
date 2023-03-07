//
//  UITestingUITests.swift
//  UITestingUITests
//
//  Created by Bonginkosi Tshabalala on 2023/03/07.
//

import XCTest

final class UITestingUITests: XCTestCase {

   // 1) When you click on a on the add button it should present a dialog and when you click on ther enter button it should check if there is text added into the textfield
    func testAddNoiseMaker() {

        let app = XCUIApplication()
        app.launch()

        let newNameBtn = app.navigationBars["Noise Makers"].buttons["Add"]
        let nameField = app.alerts["Add Noise Maker"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Shaggy"]/*[[".cells.textFields[\"Shaggy\"]",".textFields[\"Shaggy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let addBtn = app.alerts["Add Noise Maker"].scrollViews.otherElements.buttons["Add"]
        let addedCell =  app.tables/*@START_MENU_TOKEN@*/.staticTexts["Nkosi"]/*[[".cells.staticTexts[\"Nkosi\"]",".staticTexts[\"Nkosi\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/

        newNameBtn.tap()
        nameField.tap()
        nameField.typeText("Nkosi")
        XCTAssertFalse(addedCell.exists)
        addBtn.tap()

        XCTAssertTrue(addedCell.exists)
    }


    // 2) Enusre that the text is deleted

    func testDeleteNoiseMaker() {

        let app = XCUIApplication()
        app.launch()

        let newNameBtn = app.navigationBars["Noise Makers"].buttons["Add"]
        let nameField = app.alerts["Add Noise Maker"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Shaggy"]/*[[".cells.textFields[\"Shaggy\"]",".textFields[\"Shaggy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let addBtn = app.alerts["Add Noise Maker"].scrollViews.otherElements.buttons["Add"]
        let addedCell =  app.tables.staticTexts["Bobo"]
        let tablesQuery = app.tables
        let deleteBtn = tablesQuery.buttons["Delete"]

        newNameBtn.tap()
        nameField.tap()
        nameField.typeText("Bobo")
        addBtn.tap()


        addedCell.swipeLeft()
        deleteBtn.tap()
        
        XCTAssertFalse(addedCell.exists)


    }


}
