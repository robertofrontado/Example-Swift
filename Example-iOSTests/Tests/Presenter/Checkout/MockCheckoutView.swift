//
//  MockCheckoutView.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

@testable import Example_iOS

class MockCheckoutView: MockBaseView, CheckoutView {

  var getCurrencyRateSuccessfulCalled = false

  func getCurrencyRateSuccessful(currency: Currency) {
    getCurrencyRateSuccessfulCalled = true
  }
  
}
