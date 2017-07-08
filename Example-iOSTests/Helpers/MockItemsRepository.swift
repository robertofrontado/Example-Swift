//
//  MockItemsRepository.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Foundation
@testable import Example_iOS

class MockItemsRepository: ItemsRepository {

  var statusCode: Int = 200

  var error: Error? {
    let error = NSError(domain: "", code: statusCode, userInfo: nil)
    return statusCode >= 400 ? error : nil
  }

  init() {
    super.init(api: MockAPI())
  }

  override func getItems(onCompletion: @escaping ([Item], Error?) -> Void) {
    let items = error == nil ? Mocks.getItems() : []
    onCompletion(items, error)
  }

}
