//
//  CheckoutPresenterTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Quick
import Nimble
@testable import Example_iOS

class CheckoutPresenterTest: QuickSpec {

  override func spec() {
    describe("CheckoutPresenter Test") {
      var mockCurrencyRepository: MockCurrencyRepository!
      var mockView: MockCheckoutView!
      var checkoutPresenter: CheckoutPresenter!

      beforeEach {
        mockCurrencyRepository = MockCurrencyRepository()
        mockView = MockCheckoutView()
        checkoutPresenter = CheckoutPresenter(currencyRepository: mockCurrencyRepository)
        checkoutPresenter.attachView(view: mockView)
      }

      it("Should call getCurrencyRateSuccessful when getCurrencyRate is triggered") {
        checkoutPresenter.getCurrencyRate(fromCurrency: .USD, toCurrency: .EUR)
        expect(mockView.getCurrencyRateSuccessfulCalled).to(beTrue())
      }

      it("Should call showError error if getCurrencyRate fails") {
        mockCurrencyRepository.statusCode = 401
        checkoutPresenter.getCurrencyRate(fromCurrency: .USD, toCurrency: .EUR)
        expect(mockView.showErrorCalled).to(beTrue())
      }

      it("Should call showError error if fromCurrency or toCurrency are nil") {
        checkoutPresenter.getCurrencyRate(fromCurrency: nil, toCurrency: nil)
        expect(mockView.showErrorCalled).to(beTrue())
      }
    }
  }
  
}
