//
//  HomePresenterTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Quick
import Nimble
import RxSwift
@testable import Example_iOS

class HomePresenterTest: QuickSpec {

  override func spec() {
    describe("HomePresenter Test") {
      var mockItemsRepository: MockItemsRepository!
      var mockView: MockHomeView!
      var disposeBag: DisposeBag!
      var mockTransformations: MockTransformations!
      var homePresenter: HomePresenter!

      beforeEach {
        mockItemsRepository = MockItemsRepository()
        mockView = MockHomeView()
        disposeBag = DisposeBag()
        mockTransformations = MockTransformations()
        homePresenter = HomePresenter(disposeBag: disposeBag, transformations: mockTransformations, itemsRepository: mockItemsRepository)
        homePresenter.attachView(view: mockView)
      }

      it("Should call getItemsSuccesful when getItems is triggered") {
        homePresenter.getItems()
        expect(mockView.getItemsSuccesfulCalled).to(beTrue())
      }
    }
  }
  
}
