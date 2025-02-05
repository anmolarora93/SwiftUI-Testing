//
//  UITestingSampleUITests.swift
//  UITestingSampleUITests
//

import XCTest

final class UITestingSampleUITests: XCTestCase {
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.launch()
    }

    func testGameStyleSwitch() {
        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        tabBar.buttons["Game Screen"].tap()
        let slideButton = app.segmentedControls.buttons["Slide"]
        let typeButton = app.segmentedControls.buttons["Type"]
        let slideLabel = app.staticTexts["Get as close as you can to: "]
        let typeLabel = app.staticTexts["Guess where the slider is: "]

        if slideButton.isSelected {
            XCTAssertTrue(slideLabel.exists)
            XCTAssertFalse(typeLabel.exists)
            typeButton.tap()
            XCTAssertTrue(typeLabel.exists)
            XCTAssertFalse(slideLabel.exists)
        } else if typeButton.isSelected {
            XCTAssertTrue(typeLabel.exists)
            XCTAssertFalse(slideLabel.exists)
            slideButton.tap()
            XCTAssertTrue(slideLabel.exists)
            XCTAssertFalse(typeLabel.exists)
        }
    }

    func testTabBarControllerExists() throws {
        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        XCTAssertTrue(tabBar.exists)
        XCTAssertTrue(tabBar.buttons["Game Screen"].exists)
        XCTAssertTrue(tabBar.buttons["Login"].exists)
    }

    func testLoginScreen() throws {
        XCTAssertTrue(app.staticTexts["LoginScreenTitleLabel"].exists)

        let userNameTextField = app.textFields["UsernameTextField"]
        XCTAssertTrue(userNameTextField.exists)
        userNameTextField.tap()
        userNameTextField.typeText("testuser")

        let passwordTextField = app.secureTextFields["PasswordTextField"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText("Test@123")

        let loginButton = app.buttons["LoginButton"]
        XCTAssertTrue(loginButton.exists)
    }
}
