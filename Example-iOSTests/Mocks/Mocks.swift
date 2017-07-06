//
//  Mocks.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

@testable import Example_iOS

class Mocks {

  // MARK: - Item
  static func getItem() -> Item {
    return getItems().first!
  }

  static func getItems() -> [Item] {
    let item = Item(name: "item", price: 1)
    return [item, item, item]
  }

  // MARK: - Currency
  static func getCurrencyUSD() -> Currency {
    return Currency(type: .USD, rate: 1)
  }

  static func getCurrencyEUR() -> Currency  {
    return Currency(type: .EUR, rate: 0.8)
  }

}
