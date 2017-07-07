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

  private let itemsRepository: ItemsRepository

  init(itemsRepository: ItemsRepository) {
    self.itemsRepository = itemsRepository
    super.init()
  }

  func getItems() {
    itemsRepository.getItems { (items, error) in
      if let error = error {
        self.view?.showError(error: error)
        return
      }
      self.view?.getItemsCompleted(items: items)
    }
  }
  
}
