//
//  HomeViewController.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit
import OkDataSources

class HomeViewController: BaseViewController<HomePresenter>, HomeView, CheckoutViewControllerDelegate {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var checkoutBtn: UIButton!

  @IBOutlet weak var checkoutBtnHeightConstraint: NSLayoutConstraint!

  var checkoutBtnHeight: CGFloat = 64
  var dataSource: HomeTableViewDataSource!
  var homeItemViewModels = [HomeItemViewModel]()

  override func viewDidLoad() {
    super.viewDidLoad()

    dataSource = HomeTableViewDataSource(onItemModified: { item in
      self.updateCheckoutBtn()
    })

    tableView.dataSource = dataSource
    presenter.getItems()
  }

  // MARK: - HomeView
  func getItemsCompleted(items: [Item]) {
    homeItemViewModels = items.map { HomeItemViewModel(item: $0) }
    dataSource.items = homeItemViewModels
    tableView.reloadData(with: .automatic)
  }

  // MARK: - Private methods
  internal func updateCheckoutBtn() {
    let checkoutText = "Checkout: \(CurrencyType.USD.getSymbol()) \(getTotalPrice())"
    checkoutBtn.setTitle(checkoutText, for: .normal)
    self.checkoutBtnHeightConstraint.constant = getTotalPrice() > 0 ? checkoutBtnHeight : 0
    UIView.animate(withDuration: 0.3, animations: {
      self.view.layoutIfNeeded()
    })
  }

  internal func getTotalPrice() -> Float {
    let itemsPrice = homeItemViewModels.flatMap { ($0.item.price ?? 0) * Float($0.amount) }
    return itemsPrice.reduce(0) { $0 + $1 }
  }

  // MARK: - Actions
  @IBAction func checkout() {
    // Checkout -> USD as default currency
    wireframe.checkout(delegate: self, price: getTotalPrice(), currency: Currency(type: .USD, rate: 1))
  }

  // MARK: - CheckoutViewControllerDelegate
  func onCheckoutCompleted() {
    // Reset amount of each item
    homeItemViewModels = homeItemViewModels.map {
      $0.amount = 0
      return $0
    }
    dataSource.items = homeItemViewModels
    tableView.reloadData(with: .left)
    updateCheckoutBtn()
  }
}
