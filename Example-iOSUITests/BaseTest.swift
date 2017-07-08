//
//  BaseTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import XCTest

class BaseTest: XCTestCase {

  internal let app = XCUIApplication()

  let timeout: TimeInterval = 60
  let existsPredicate = NSPredicate(format: "exists == 1")
  let doesNotExistPredicate = NSPredicate(format: "exists == 0")
  let hitablePredicate = NSPredicate(format: "hittable == 1")
  let notHitablePredicate = NSPredicate(format: "hittable == 0")
  let enabledPredicate = NSPredicate(format: "enabled == 1")
  let disabledPredicate = NSPredicate(format: "enabled == 0")

  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    app.launch()
  }

  override func tearDown() {
    super.tearDown()
  }

  func waitFor(element: XCUIElement, toBeHittable hittable: Bool = false) {
    if hittable == true {
      expectation(for: hitablePredicate, evaluatedWith: element, handler: nil)
      waitForExpectations(timeout: timeout, handler: nil)
    } else {
      expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
      waitForExpectations(timeout: timeout, handler: nil)
    }
  }

  func waitAndTap(element: XCUIElement) {
    waitFor(element: element, toBeHittable: true)
    element.tap()
  }
}
