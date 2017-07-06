//
//  HomePresenter.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

class HomePresenter: BasePresenter {

  internal var view: HomeView? {
    return baseView as? HomeView
  }

  override init() {
    super.init()
  }
  
}
