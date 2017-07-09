//
//  CurrencyRepositoryTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Quick
import Nimble
import Moya
import RxSwift
@testable import Example_iOS

class CurrencyRepositoryTest: QuickSpec {

  override func spec() {
    describe("CurrencyRepository Test") {
      var mockAPI: RxMoyaProvider<API>!
      var mockTransformations: MockTransformations!
      var currencyRepository: CurrencyRepository!

      beforeEach {
        mockAPI = RxMoyaProvider<API>(stubClosure: MoyaProvider.immediatelyStub)
        mockTransformations = MockTransformations()
        currencyRepository = CurrencyRepository(api: mockAPI, transformations: mockTransformations)
      }

      it("Should return items if there's no error") {
        currencyRepository.getCurrencyRate(
          fromCurrency: .USD,
          toCurrency: .EUR)
        .subscribe(onNext: { currency in
          expect(currency.type).to(equal(.EUR))
        }, onError: { _ in
          assertionFailure()
        })
      }
    }
  }

}
