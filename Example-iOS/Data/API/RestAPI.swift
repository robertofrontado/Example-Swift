//
//  RestAPI.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class RestAPI: API {

  func getItems(onCompletion: @escaping (_ items: [Item], _ error: Error?) -> Void) {
    Alamofire.request("https://raw.githubusercontent.com/robertofrontado/Example-iOS/develop/Items.json", method: .get)
      .responseArray(completionHandler: { (response: DataResponse<[Item]>) in
        let items: [Item] = response.result.value ?? []
        onCompletion(items, response.result.error)
      })
  }

  func getCurrencyRate(fromCurrency: CurrencyType, toCurrency: CurrencyType, onCompletion: @escaping (_ currency: Currency?, _ error: Error?) -> Void) {
    let parameters = [
      "access_key": "b0a0d32b0204834af37d2c40ec68d6e3",
      "currencies": toCurrency.rawValue,
      "source": fromCurrency.rawValue
    ]

    Alamofire.request("http://apilayer.net/api/live",
                      method: .get,
                      parameters: parameters)
      .responseObject { (response: DataResponse<Currency>) in
      var currency = response.result.value
      currency?.type = toCurrency
      onCompletion(currency, response.result.error)
    }
  }

}


