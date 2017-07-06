//
//  BasePresenter.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

class BasePresenter {

  internal weak var baseView: BaseView?

  init() {}

  func attachView<T: BaseView>(view: T) {
    self.baseView = view
  }
}
