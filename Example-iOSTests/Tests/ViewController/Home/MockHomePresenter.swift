//
//  MockHomePresenter.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

@testable import Example_iOS

class MockHomePresenter: HomePresenter {

  init() {
    super.init(itemsRepository: MockItemsRepository())
  }

  override func getItems() {
    view?.getItemsSuccesful(items: Mocks.getItems())
  }
}
