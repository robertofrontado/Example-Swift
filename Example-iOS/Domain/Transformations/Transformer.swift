//
//  Transformer.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/9/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import RxSwift

class Transformer<E> {
  
  let call: ((Observable<E>) -> Observable<E>)
  
  init(call: @escaping ((Observable<E>) -> Observable<E>)) {
    self.call = call
  }
}
