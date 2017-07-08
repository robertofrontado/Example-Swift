//
//  MockWireframe.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

@testable import Example_iOS

class MockWireframe: Wireframe {

  var homeCalled = false
  var checkoutCalled = false
  var popCurrentScreenCalled = false

  // MARK: - Home
  func home() {
    homeCalled = true
  }

  // MARK: - Currency
  func checkout(delegate: CheckoutViewControllerDelegate, price: Float, currency: Currency) {
    checkoutCalled = true
  }

  // MARK: - Pop current screen
  func popCurrentScreen() {
    popCurrentScreenCalled = true
  }

  func popCurrentScreen(onCompletion: @escaping () -> Void) {
    popCurrentScreenCalled = true
    onCompletion()
  }

  func popCurrentScreen(animated: Bool) {
    popCurrentScreenCalled = true
  }

  func popCurrentScreen(animated: Bool, onCompletion: @escaping () -> Void) {
    popCurrentScreenCalled = true
    onCompletion()
  }
  
}
