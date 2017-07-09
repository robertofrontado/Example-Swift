//
//  BasePresenter.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import RxSwift

class BasePresenter {

  internal weak var baseView: BaseView?
  internal let disposeBag: DisposeBag
  internal let transformations: Transformations

  init(disposeBag: DisposeBag, transformations: Transformations) {
    self.disposeBag = disposeBag
    self.transformations = transformations
  }

  func attachView<T: BaseView>(view: T) {
    self.baseView = view
  }
}
