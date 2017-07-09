//
//  Transformations.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/9/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Moya

protocol Transformations {

  func safely<E>() -> Transformer<E>
  func loading<E>(view: BaseView?) -> Transformer<E>
  func reportError<E>(view: BaseView?) -> Transformer<E>
  func handleError<E: Response>() -> Transformer<E>
}
