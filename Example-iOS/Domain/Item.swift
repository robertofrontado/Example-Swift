//
//  Item.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import ObjectMapper

struct Item: Mappable {

  var name: String?
  var price: Float?

  init(name: String, price: Float) {
    self.name = name
    self.price = price
  }

  init?(map: Map) {

  }

  mutating func mapping(map: Map) {
    name <- map["name"]
    price <- map["price"]
  }

}
