//
//  ItemsRepositoryTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Quick
import Nimble
@testable import Example_iOS

class ItemsRepositoryTest: QuickSpec {

  override func spec() {
    describe("ItemsRepository Test") {
      var mockAPI: MockAPI!
      var itemsRepository: ItemsRepository!

      beforeEach {
        mockAPI = MockAPI()
        itemsRepository = ItemsRepository(api: mockAPI)
      }

      it("Should return items if there's no error") {
        itemsRepository.getItems(onCompletion: { (items, error) in
          expect(error).to(beNil())
          expect(items.count).to(equal(3))
        })
      }

      it("Should return an error if something is wrong") {
        mockAPI.statusCode = 401
        itemsRepository.getItems(onCompletion: { (items, error) in
          expect(error).toNot(beNil())
          expect(items.count).to(equal(0))
        })
      }
    }
  }

}
