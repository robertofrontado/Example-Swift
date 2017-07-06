//
//  CurrencyRepositoryTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Quick
import Nimble
@testable import Example_iOS

class CurrencyRepositoryTest: QuickSpec {

  override func spec() {
    describe("CurrencyRepository Test") {
      var mockAPI: MockAPI!
      var currencyRepository: CurrencyRepository!

      beforeEach {
        mockAPI = MockAPI()
        currencyRepository = CurrencyRepository(api: mockAPI)
      }

      it("Should return items if there's no error") {
        currencyRepository.getCurrencyRate(
          fromCurrency: .USD,
          toCurrency: .EUR,
          onCompletion: { (currency, error) in
            expect(error).to(beNil())
            expect(currency).toNot(beNil())
            expect(currency?.type).to(equal(.EUR))
        })
      }

      it("Should return an error if something is wrong") {
        mockAPI.statusCode = 401
        currencyRepository.getCurrencyRate(
          fromCurrency: .USD,
          toCurrency: .EUR,
          onCompletion: { (currency, error) in
            expect(error).toNot(beNil())
            expect(currency).to(beNil())
        })
      }
    }
  }

}
