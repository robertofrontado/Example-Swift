//
//  MockTransformations.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/9/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Moya
import RxSwift
@testable import Example_iOS

class MockTransformations: Transformations {

  var safelyCalled = false
  var loadingCalled = false
  var reportErrorCalled = false
  var handleErrorCalled = false

  func safely<E>() -> Transformer<E> {
    safelyCalled = true
    return Transformer(call: { observable in
      return observable.observeOn(MainScheduler.instance)
    })
  }

  func loading<E>(view: BaseView?) -> Transformer<E> {
    loadingCalled = true
    return Transformer(call: { observable in
      return observable
    })
  }

  func reportError<E>(view: BaseView?) -> Transformer<E> {
    reportErrorCalled = true
    return Transformer(call: { observable in
      return observable
    })
  }

  func handleError<E: Response>() -> Transformer<E> {
    handleErrorCalled = true
    return Transformer(call: { observable in
      return observable
    })
  }
}
