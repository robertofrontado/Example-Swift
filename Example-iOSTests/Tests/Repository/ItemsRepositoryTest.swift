//
//  ItemsRepositoryTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Quick
import Nimble
import Moya
import RxSwift
@testable import Example_iOS

class ItemsRepositoryTest: QuickSpec {

  override func spec() {
    describe("ItemsRepository Test") {
      var mockAPI: RxMoyaProvider<API>!
      var mockTransformations: MockTransformations!
      var itemsRepository: ItemsRepository!

      beforeEach {
        mockAPI = RxMoyaProvider<API>(stubClosure: MoyaProvider.immediatelyStub)
        mockTransformations = MockTransformations()
        itemsRepository = ItemsRepository(api: mockAPI, transformations: mockTransformations)
      }

      it("Should return items if there's no error") {
        itemsRepository.getItems()
        .subscribe(onNext: { items in
          expect(items.count).to(equal(4))
        }, onError: { _ in
          assertionFailure()
        })
      }
    }
  }

}
