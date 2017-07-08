//
//  CheckoutPresenter.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Foundation

class CheckoutPresenter: BasePresenter {

  internal var view: CheckoutView? {
    return baseView as? CheckoutView
  }

  private let currencyRepository: CurrencyRepository

  init(currencyRepository: CurrencyRepository) {
    self.currencyRepository = currencyRepository
    super.init()
  }

  func getCurrencyRate(fromCurrency: CurrencyType?, toCurrency: CurrencyType?) {
    guard let fromCurrency = fromCurrency, let toCurrency = toCurrency else {
      self.view?.showError(error: NSError(domain: "Missing currencies", code: 0, userInfo: nil))
      return
    }

    self.view?.showLoading()
    currencyRepository.getCurrencyRate(fromCurrency: fromCurrency, toCurrency: toCurrency) { (currency, error) in
      self.view?.hideLoading()
      if let error = error {
        self.view?.showError(error: error)
      } else if let currency = currency {
        self.view?.getCurrencyRateSuccessful(currency: currency)
      }
    }
  }
}
