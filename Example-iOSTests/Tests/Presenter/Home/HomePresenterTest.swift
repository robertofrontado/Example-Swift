//
//  HomePresenterTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Quick
import Nimble
@testable import Example_iOS

class HomePresenterTest: QuickSpec {

  override func spec() {
    describe("HomePresenter Test") {
      var mockItemsRepository: MockItemsRepository!
      var mockView: MockHomeView!
      var homePresenter: HomePresenter!

      beforeEach {
        mockItemsRepository = MockItemsRepository()
        mockView = MockHomeView()
        homePresenter = HomePresenter(itemsRepository: mockItemsRepository)
        homePresenter.attachView(view: mockView)
      }

      it("Should call getItemsSuccesful when getItems is triggered") {
        homePresenter.getItems()
        expect(mockView.getItemsSuccesfulCalled).to(beTrue())
      }

      it("Should call showError error if getItems fails") {
        mockItemsRepository.statusCode = 401
        homePresenter.getItems()
        expect(mockView.showErrorCalled).to(beTrue())
      }
    }
  }
  
}
