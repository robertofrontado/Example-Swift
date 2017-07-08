//
//  MockCheckoutPresenter.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

@testable import Example_iOS

class MockCheckoutPresenter: CheckoutPresenter {

  var getCurrencyRateCalled = false

  init() {
    super.init(currencyRepository: MockCurrencyRepository())
  }

  override func getCurrencyRate(fromCurrency: CurrencyType?, toCurrency: CurrencyType?) {
    getCurrencyRateCalled = true
  }
}
