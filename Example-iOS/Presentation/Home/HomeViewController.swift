//
//  HomeViewController.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit
import OkDataSources

class HomeViewController: BaseViewController<HomePresenter>, HomeView {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var checkoutBtn: UIButton!

  @IBOutlet weak var checkoutBtnHeightConstraint: NSLayoutConstraint!

  var checkoutBtnHeight: CGFloat = 64
  var dataSource: HomeTableViewDataSource!
  var itemsSelected = [Item]()

  override func viewDidLoad() {
    super.viewDidLoad()

    dataSource = HomeTableViewDataSource(onItemAdded: { item in
      self.itemsSelected.append(item)
      self.updateCheckoutBtn()
    }, onItemRemoved: { item in
      for i in 0..<self.itemsSelected.count {
        if item.name == self.itemsSelected[i].name {
          self.itemsSelected.remove(at: i)
          break
        }
      }
      self.updateCheckoutBtn()
    })

    tableView.dataSource = dataSource
    presenter.getItems()
  }

  // MARK: - HomeView
  func getItemsCompleted(items: [Item]) {
    let homeItemViewModel = items.map { HomeItemViewModel(item: $0, amount: 0) }
    dataSource.items = homeItemViewModel
    tableView.reloadData()
  }

  // MARK: - Private methods
  internal func updateCheckoutBtn() {
    let checkoutText = "Checkout: \(CurrencyType.USD.getSymbol()) \(getTotalPrice())"
    checkoutBtn.setTitle(checkoutText, for: .normal)
    self.checkoutBtnHeightConstraint.constant = self.itemsSelected.count > 0 ? checkoutBtnHeight : 0
    UIView.animate(withDuration: 0.3, animations: {
      self.view.layoutIfNeeded()
    })
  }

  internal func getTotalPrice() -> Float {
    return itemsSelected.reduce(0) { $0 + ($1.price ?? 0)}
  }

  // MARK: - Actions
  @IBAction func checkout() {
    print("checkout")
  }
}
