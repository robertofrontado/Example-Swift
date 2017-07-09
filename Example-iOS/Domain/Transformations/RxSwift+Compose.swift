//
//  RxSwift+Compose.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/9/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import RxSwift

extension ObservableType {

  func compose(_ transformable: Transformer<E>) -> Observable<E> {
    return transformable.call(self as! Observable<E>)
  }
}
