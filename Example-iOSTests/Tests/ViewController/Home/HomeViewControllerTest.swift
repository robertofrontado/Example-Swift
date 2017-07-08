//
//  HomeViewControllerTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Quick
import Nimble
@testable import Example_iOS

class HomeViewControllerTest: BaseViewControllerTest {

  override func spec() {
    describe("HomeViewController Test") {
      var mockPresenter: MockHomePresenter!
      var mockWireframe: MockWireframe!
      var viewController: HomeViewController!

      beforeEach {
        mockPresenter =  MockHomePresenter()
        mockWireframe = MockWireframe()
        viewController = UIStoryboard.getViewController("Home", clazz: HomeViewController.self)
        viewController.presenter = mockPresenter
        viewController.wireframe = mockWireframe
        viewController.preloadView()
        viewController.viewWillAppear(false)
      }

      it("Should build view correctly") {
        let homeItemViewModel = viewController.dataSource.items.first!
        let itemCell = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! HomeTableViewCell

        expect(viewController.tableView.numberOfRows(inSection: 0)).to(equal(3))
        expect(itemCell.nameLabel.text).to(equal("\(homeItemViewModel.item.name!)"))
        expect(itemCell.priceLabel.text).to(equal("$ \(homeItemViewModel.item.price!)"))
        expect(itemCell.countLabel.text).to(equal("\(homeItemViewModel.amount)"))
      }

      it("Should clear the amount of items when onCheckoutSuccesful is triggered") {
        let homeItemViewModel = viewController.dataSource.items.first!
        let itemCell = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! HomeTableViewCell
        itemCell.itemAdded()
        itemCell.itemAdded()
        itemCell.itemAdded()
        expect(homeItemViewModel.amount).to(equal(3))
        expect(viewController.checkoutBtnHeightConstraint.constant).to(equal(viewController.checkoutBtnHeight))

        itemCell.itemRemoved()
        expect(homeItemViewModel.amount).to(equal(2))

        viewController.onCheckoutSuccesful()
        expect(homeItemViewModel.amount).to(equal(0))
        expect(viewController.checkoutBtnHeightConstraint.constant).to(equal(0))
      }

      it("Should show checkoutVC when checkout is called") {
        viewController.checkout()
        expect(mockWireframe.checkoutCalled).to(beTrue())
      }

      it("Should return the total price of the items selected") {
        let homeItemViewModel = viewController.dataSource.items.first!
        homeItemViewModel.amount = 3

        expect(viewController.getTotalPrice()).to(equal(homeItemViewModel.item.price! * 3))
      }
    }
  }
}
