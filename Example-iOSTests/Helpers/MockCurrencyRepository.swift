//
//  MockCurrencyRepository.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import RxSwift
import Moya
@testable import Example_iOS

class MockCurrencyRepository: CurrencyRepository {

  init() {
    super.init(api: RxMoyaProvider(stubClosure: MoyaProvider.immediatelyStub), transformations: MockTransformations())
  }

  override func getCurrencyRate(fromCurrency: CurrencyType, toCurrency: CurrencyType) -> Observable<Currency> {
      return Observable.just(Mocks.getCurrencyEUR())
  }
}
