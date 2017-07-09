//
//  HomePresenter.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import RxSwift

class HomePresenter: BasePresenter {

  internal var view: HomeView? {
    return baseView as? HomeView
  }

  private let itemsRepository: ItemsRepository

  init(disposeBag: DisposeBag, transformations: Transformations, itemsRepository: ItemsRepository) {
    self.itemsRepository = itemsRepository
    super.init(disposeBag: disposeBag, transformations: transformations)
  }

  func getItems() {
    itemsRepository.getItems()
      .compose(transformations.safely())
      .compose(transformations.loading(view: self.view))
      .compose(transformations.reportError(view: self.view))
      .subscribe(onNext: { items in
        self.view?.getItemsSuccesful(items: items)
      }).addDisposableTo(disposeBag)
  }
  
}
