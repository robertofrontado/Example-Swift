//
//  Item.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import ObjectMapper

struct Item: Mappable {

  var id: Int?
  var name: String?
  var price: Float?

  init(id: Int, name: String, price: Float) {
    self.id = id
    self.name = name
    self.price = price
  }

  init?(map: Map) {

  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    price <- map["price"]
  }

}
