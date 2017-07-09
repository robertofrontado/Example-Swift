//
//  MockItemsRepository.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import RxSwift
import Moya
@testable import Example_iOS

class MockItemsRepository: ItemsRepository {

  init() {
    super.init(api: RxMoyaProvider(stubClosure: MoyaProvider.immediatelyStub), transformations: MockTransformations())
  }

  override func getItems() -> Observable<[Item]> {
    return Observable.just(Mocks.getItems())
  }
}
