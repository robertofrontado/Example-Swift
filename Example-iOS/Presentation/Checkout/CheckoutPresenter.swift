//
//  CheckoutPresenter.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import RxSwift
import Foundation

class CheckoutPresenter: BasePresenter {

  internal var view: CheckoutView? {
    return baseView as? CheckoutView
  }

  private let currencyRepository: CurrencyRepository

  init(disposeBag: DisposeBag, transformations: Transformations, currencyRepository: CurrencyRepository) {
    self.currencyRepository = currencyRepository
    super.init(disposeBag: disposeBag, transformations: transformations)
  }

  func getCurrencyRate(fromCurrency: CurrencyType?, toCurrency: CurrencyType?) {
    guard let fromCurrency = fromCurrency, let toCurrency = toCurrency else {
      self.view?.showError(error: NSError(domain: "Missing currencies", code: 0, userInfo: nil))
      return
    }

    currencyRepository.getCurrencyRate(fromCurrency: fromCurrency, toCurrency: toCurrency)
      .compose(transformations.safely())
      .compose(transformations.loading(view: self.view))
      .compose(transformations.reportError(view: self.view))
      .subscribe(onNext: { currency in
        self.view?.getCurrencyRateSuccessful(currency: currency)
      }).addDisposableTo(disposeBag)
    }
}
