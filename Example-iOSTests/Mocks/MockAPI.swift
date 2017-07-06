//
//  MockAPI.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Alamofire
@testable import Example_iOS

class MockAPI: RestAPI {

  var statusCode: Int = 200

  var error: Error? {
    let error = NSError(domain: "", code: statusCode, userInfo: nil)
    return statusCode >= 400 ? error : nil
  }

  override func getItems(onCompletion: @escaping ([Item], Error?) -> Void) {
    let items = error == nil ? Mocks.getItems() : []
    onCompletion(items, error)
  }

  override func getCurrenciesConvertionRate() {

  }

}
