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

  func getItems(onCompletion: @escaping (_ result: Result<[Item]>) -> Void) {
    Alamofire.request("https://raw.githubusercontent.com/robertofrontado/Example-iOS/develop/Items.json", method: .get)
      .responseArray { onCompletion($0.result) }
  }

  func getCurrenciesConvertionRate() {
//    access_key=b0a0d32b0204834af37d2c40ec68d6e3&currencies=EUR,GBP,CAD,PLN&source=USD&format=1
//    Alamofire.request("http://apilayer.net/api/live",
//                      method: .get,
//                      param)
  }

}


struct CurrencyRate {

  var quotes: [String: Float]
//  {
//  "success":true,
//  "terms":"https:\/\/currencylayer.com\/terms",
//  "privacy":"https:\/\/currencylayer.com\/privacy",
//  "timestamp":1499368747,
//  "source":"USD",
//  "quotes":{
//  "USDEUR":0.875504,
//  "USDGBP":0.77131,
//  "USDCAD":1.29622,
//  "USDPLN":3.7103
//  }
//  }
}

struct Currency {

  var rate: Float
}
