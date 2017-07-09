//
//  MockCheckoutPresenter.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import RxSwift
@testable import Example_iOS

class MockCheckoutPresenter: CheckoutPresenter {

  var getCurrencyRateCalled = false

  init() {
    super.init(disposeBag: DisposeBag(), transformations: MockTransformations(), currencyRepository: MockCurrencyRepository())
  }

  override func getCurrencyRate(fromCurrency: CurrencyType?, toCurrency: CurrencyType?) {
    getCurrencyRateCalled = true
  }
}
