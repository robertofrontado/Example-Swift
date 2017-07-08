//
//  CheckoutViewControllerTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Nimble
import Quick
@testable import Example_iOS

class CheckoutViewControllerTest: BaseViewControllerTest {

  override func spec() {
    describe("CheckoutViewController Test") {
      var mockPresenter: MockCheckoutPresenter!
      var mockWireframe: MockWireframe!
      var mockDelegate: MockCheckoutViewControllerDelegate!
      var viewController: CheckoutViewController!
      let originalCurrency = Mocks.getCurrencyUSD()
      let originalPrice: Float = 10

      beforeEach {
        mockPresenter = MockCheckoutPresenter()
        mockWireframe = MockWireframe()
        mockDelegate = MockCheckoutViewControllerDelegate()
        viewController = UIStoryboard.getViewController("Checkout", clazz: CheckoutViewController.self)
        viewController.presenter = mockPresenter
        viewController.wireframe = mockWireframe
        viewController.delegate = mockDelegate
        viewController.originalCurrency = originalCurrency
        viewController.currency = originalCurrency
        viewController.originalPrice = originalPrice
        viewController.currentPrice = originalPrice
        viewController.preloadView()
        viewController.viewWillAppear(false)
      }

      it("Should build view correctly") {
        expect(viewController.priceLabel.text).to(equal("\(originalCurrency.type!.getSymbol()) \(originalPrice)"))
      }

      it("Should call popViewController when dismiss is triggered") {
        viewController.dismiss()
        expect(mockWireframe.popCurrentScreenCalled).toNot(beTrue())
      }

      it("Should refreshView when getCurrencyRateSuccessful is called") {
        viewController.getCurrencyRateSuccessful(currency: Mocks.getCurrencyEUR())
        expect(viewController.currency?.type).to(equal(Mocks.getCurrencyEUR().type))
        expect(viewController.currency?.rate).to(equal(Mocks.getCurrencyEUR().rate))
        expect(viewController.currentPrice).to(equal(Mocks.getCurrencyEUR().rate! * originalPrice))
        expect(viewController.priceLabel.text)
          .to(equal("\(Mocks.getCurrencyEUR().type!.getSymbol()) \(Mocks.getCurrencyEUR().rate! * originalPrice)"))
      }

      it("Should call popViewController if cancelOrder is triggered") {
        viewController.cancelOrder()
        expect(mockWireframe.popCurrentScreenCalled).toNot(beTrue())
      }

      it("Should set originalCurrency if getPriceUSD is called") {
        viewController.getPriceUSD()
        expect(viewController.currentPrice).to(equal(viewController.originalPrice))
        expect(viewController.currency?.type).to(equal(viewController.currency?.type))
        expect(viewController.currency?.rate).to(equal(viewController.currency?.rate))
      }

      it("Should call getCurrencyRate if getPriceGBP is triggered") {
        viewController.getPriceEUR()
        expect(mockPresenter.getCurrencyRateCalled).to(beTrue())
      }

      it("Should call getCurrencyRate if getPriceGBP is triggered") {
        viewController.getPriceGBP()
        expect(mockPresenter.getCurrencyRateCalled).to(beTrue())
      }

      it("Should show an alert if buyItems is triggered and it should call onCheckoutSuccesful") {
        viewController.buyItems()
        expect(self.checkIfAlertViewIsShown(title: "Congratulations!",
                                            message: "You'll receive your order shortly",
                                            actionsTitles: ["Ok"]))
        .to(beTrue())
        self.triggerAction(withTitle: "Ok")
        expect(mockWireframe.popCurrentScreenCalled).toEventually(beTrue())
        expect(mockDelegate.onCheckoutSuccesfulCalled).toEventually(beTrue())
      }
    }
  }
}
