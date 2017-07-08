//
//  HappyPathTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import XCTest

class HappyPathTest: BaseTest {

  func testHappyPath() {

    // MARK: Splash
    // Nothing... Just wait

    // MARK: Home
    let tableView = app.tables.element(boundBy: 0)
    let firstCell = tableView.cells.element(boundBy: 0)
    let firstCellAddBtn = firstCell.buttons["item.button.add"]

    waitAndTap(element: firstCellAddBtn)
    firstCellAddBtn.tap()
    firstCellAddBtn.tap()
    firstCellAddBtn.tap()

    let secondCell = tableView.cells.element(boundBy: 1)
    let secondCellAddBtn = secondCell.buttons["item.button.add"]

    secondCellAddBtn.tap()
    secondCellAddBtn.tap()

    let firstCellRemoveBtn = firstCell.buttons["item.button.remove"]

    firstCellRemoveBtn.tap()

    let checkoutBtn = app.buttons["button.checkout"]
    checkoutBtn.tap()

    expectation(for: notHitablePredicate, evaluatedWith: checkoutBtn, handler: nil)
    waitForExpectations(timeout: timeout, handler: nil)

    // MARK: Checkout
    let eurButton = app.buttons["button.eur"]
    waitAndTap(element: eurButton)

    let usdButton = app.buttons["button.usd"]
    waitAndTap(element: usdButton)

    let gbpButton = app.buttons["button.gbp"]
    waitAndTap(element: gbpButton)

    let buyButton = app.buttons["button.buy"]
    buyButton.tap()

    // Alert congratulations
    let alertOkBtn = app.alerts.buttons.element(boundBy: 0)
    if alertOkBtn.exists {
      alertOkBtn.tap()
    }

    expectation(for: doesNotExistPredicate, evaluatedWith: buyButton, handler: nil)
    waitForExpectations(timeout: timeout, handler: nil)
  }

}
