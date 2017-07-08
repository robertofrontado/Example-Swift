//
//  MockCurrencyRepository.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Foundation
@testable import Example_iOS

class MockCurrencyRepository: CurrencyRepository {

  var statusCode: Int = 200

  var error: Error? {
    let error = NSError(domain: "", code: statusCode, userInfo: nil)
    return statusCode >= 400 ? error : nil
  }

  init() {
    super.init(api: MockAPI())
  }

  override func getCurrencyRate(fromCurrency: CurrencyType, toCurrency: CurrencyType, onCompletion: @escaping (Currency?, Error?) -> Void) {
    let currency = error == nil ? Mocks.getCurrencyEUR() : nil
    onCompletion(currency, error)
  }
}
