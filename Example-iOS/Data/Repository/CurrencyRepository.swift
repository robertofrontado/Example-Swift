//
//  CurrencyRepository.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

class CurrencyRepository: BaseRepository {

  override init(api: API) {
    super.init(api: api)
  }

  func getCurrencyRate(fromCurrency: CurrencyType, toCurrency: CurrencyType, onCompletion: @escaping (_ currency: Currency?, _ error: Error?) -> Void) {
    api.getCurrencyRate(fromCurrency: fromCurrency, toCurrency: toCurrency, onCompletion: onCompletion)
  }

}
