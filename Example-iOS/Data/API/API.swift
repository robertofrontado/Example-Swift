//
//  MoyaAPI.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/9/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Moya

enum API {
  case getItems()
  case getCurrencyRate(fromCurrency: CurrencyType, toCurrency: CurrencyType)
}

extension API: TargetType {
  var baseURL: URL {
    switch self {
    case .getItems:
      return URL(string: "https://raw.githubusercontent.com/robertofrontado/Example-iOS/")!
    case .getCurrencyRate:
      return URL(string: "http://apilayer.net/api/")!
    }

  }

  var path: String {
    switch self {
    case .getItems:
      return "develop/Items.json"
    case .getCurrencyRate:
      return "live"
    }
  }

  var method: Moya.Method {
    switch self {
    case .getItems,
         .getCurrencyRate:
      return .get
    }
  }

  var parameters: [String: Any]? {
    switch self {
    case .getCurrencyRate(let fromCurrency, let toCurrency):
      return [
        "access_key": "b0a0d32b0204834af37d2c40ec68d6e3",
        "currencies": toCurrency.rawValue,
        "source": fromCurrency.rawValue
      ]
    default:
      return nil
    }
  }

  var parameterEncoding: ParameterEncoding {
    switch self {
    case .getItems,
         .getCurrencyRate:
      return URLEncoding.default
    }
  }

  var task: Task {
    switch self {
    default:
      return .request
    }
  }

  var sampleData: Data {
    switch self {
    case .getItems():
      return "[{\"id\":1,\"name\":\"Peas\",\"price\":123.95,\"currency\":\"USD\"},{\"id\":2,\"name\":\"Eggs\",\"price\":2.1,\"currency\":\"USD\"},{\"id\":3,\"name\":\"Milk\",\"price\":1.3,\"currency\":\"USD\"},{\"id\":4,\"name\":\"Beans\",\"price\":0.73,\"currency\":\"USD\"}]".data(using: .utf8)!
    case .getCurrencyRate:
      return "{\"success\":true,\"terms\":\"https://currencylayer.com/terms\",\"privacy\":\"https://currencylayer.com/privacy\",\"timestamp\":1499629454,\"source\":\"USD\",\"quotes\":{\"USDEUR\":0.877201,\"USDGBP\":0.77629,\"USDCHF\":0.963397}}".data(using: .utf8)!
    }
  }
}
