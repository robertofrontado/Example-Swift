//
//  MockCheckoutViewControllerDelegate.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

@testable import Example_iOS

class MockCheckoutViewControllerDelegate: CheckoutViewControllerDelegate {

  var onCheckoutSuccesfulCalled = false

  func onCheckoutSuccesful() {
    onCheckoutSuccesfulCalled = true
  }
}
