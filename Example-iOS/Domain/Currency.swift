//
//  Currency.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import ObjectMapper

enum CurrencyType: String {
  case USD = "USD"
  case EUR = "EUR"
  case GBP = "GBP"
}

struct Currency: Mappable {

  var type: CurrencyType?
  var quotes: [String: Float]?
  var rate: Float?

  init(type: CurrencyType, rate: Float) {
    self.type = type
    self.rate = rate
  }

  init?(map: Map) {

  }

  mutating func mapping(map: Map) {
    type <- map["type"]
    quotes <- map["quotes"]
    rate = quotes?.first?.value
  }
}
