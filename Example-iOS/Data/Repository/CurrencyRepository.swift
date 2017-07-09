//
//  CurrencyRepository.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper

class CurrencyRepository: BaseRepository<API> {

  override init(api: RxMoyaProvider<API>, transformations: Transformations) {
    super.init(api: api, transformations: transformations)
  }

  func getCurrencyRate(fromCurrency: CurrencyType, toCurrency: CurrencyType) -> Observable<Currency> {
    return api.request(.getCurrencyRate(fromCurrency: fromCurrency, toCurrency: toCurrency))
      .compose(transformations.handleError())
      .mapObject(Currency.self)
      .map { currency in
        var currency = currency
        currency.type = toCurrency
        return currency
      }
  }

}
