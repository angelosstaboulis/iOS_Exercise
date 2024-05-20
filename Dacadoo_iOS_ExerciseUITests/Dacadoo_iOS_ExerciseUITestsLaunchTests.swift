//
//  Dacadoo_iOS_ExerciseUITestsLaunchTests.swift
//  Dacadoo_iOS_ExerciseUITests
//
//  Created by Angelos Staboulis on 17/5/24.
//

import XCTest

final class Dacadoo_iOS_ExerciseUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
