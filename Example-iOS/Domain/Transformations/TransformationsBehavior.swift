//
//  TransformationsBehavior.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/9/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import RxSwift
import Moya

class TransformationsBehavior: Transformations {

  func safely<E>() -> Transformer<E> {
    return Transformer(call: {  observable in
      return observable.subscribeOn(SerialDispatchQueueScheduler(qos: .background))
        .observeOn(MainScheduler.instance)
    })
  }

  func loading<E>(view: BaseView?) -> Transformer<E> {
    return Transformer(call: {  observable in
      view?.showLoading()
      return observable.do(onError: { _ in
        view?.hideLoading()
      } ,onCompleted: {
        view?.hideLoading()
      })
    })
  }

  func reportError<E>(view: BaseView?) -> Transformer<E> {
    return Transformer(call: {  observable in
      return observable.do(onError: { error in
        view?.showError(error: error)
      })
    })
  }

  func handleError<E: Response>() -> Transformer<E> {
    return Transformer(call: { observable -> Observable<E> in
      return observable.flatMap { (response: Response) -> Observable<E> in
        do {
          let filteredResponse = try response.filterSuccessfulStatusCodes() as! E
          return Observable.just(filteredResponse)
        } catch {
          let error = String(data: response.data, encoding: .utf8)!
          return Observable.error(NSError(domain: error,
                                          code: response.statusCode,
                                          userInfo: nil))
        }
      }
    })
  }
}
