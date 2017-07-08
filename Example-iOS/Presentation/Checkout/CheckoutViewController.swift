//
//  CheckoutViewController.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit

protocol CheckoutViewControllerDelegate: class {
  func onCheckoutSuccesful()
}

class CheckoutViewController: BaseViewController<CheckoutPresenter>, CheckoutView {

  @IBOutlet weak var priceLabel: UILabel!

  weak var delegate: CheckoutViewControllerDelegate?
  var originalPrice: Float = 0
  var originalCurrency: Currency?
  var currency: Currency?
  var currentPrice: Float = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    refreshView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    showPopUpAnimation()
  }

  // MARK: - Private Methods
  internal func refreshView() {
    if let currency = currency,
      let type = currency.type,
      let rate = currency.rate {
      currentPrice = originalPrice * rate
      priceLabel.text = "\(type.getSymbol()) \(currentPrice)"
    }
  }

  internal func dismiss(onCompletion: (() -> Void)? = nil) {
    hidePopUpAnimation {
      self.wireframe.popCurrentScreen(animated: false) { onCompletion?() }
    }
  }

  // MARK: - CheckoutView
  func getCurrencyRateSuccessful(currency: Currency) {
    self.currency = currency
    refreshView()
  }

  // MARK: - Actions
  @IBAction func cancelOrder() {
    dismiss()
  }

  @IBAction func buyItems() {
    UIAlertController.showAlertOneButton("Congratulations!", message: "You'll receive your order shortly", buttonTitle: "Ok") { 
      self.dismiss {
        self.delegate?.onCheckoutSuccesful()
      }
    }
  }

  @IBAction func getPriceUSD() {
    if let currency = originalCurrency {
      getCurrencyRateSuccessful(currency: currency)
    }
  }

  @IBAction func getPriceEUR() {
    presenter.getCurrencyRate(fromCurrency: originalCurrency?.type, toCurrency: .EUR)
  }

  @IBAction func getPriceGBP() {
    presenter.getCurrencyRate(fromCurrency: originalCurrency?.type, toCurrency: .GBP)
  }

}
