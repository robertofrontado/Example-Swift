//
//  HomeTableViewCell.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import OkDataSources

class HomeTableViewCell: UITableViewCell, OkViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!

  var onItemModified: ((_ item: HomeItemViewModel) -> Void)?

  internal var itemViewModel: HomeItemViewModel!
  
  func configureItem(_ itemViewModel: HomeItemViewModel) {
    self.itemViewModel = itemViewModel
    nameLabel.text = itemViewModel.item.name
    if let price = itemViewModel.item.price {
      priceLabel.text = "\(CurrencyType.USD.getSymbol()) \(price)"
    }
    countLabel.text = "\(itemViewModel.amount)"
  }

  func itemAmountChanged(amount: Int) {
    itemViewModel.amount += amount
    if itemViewModel.amount < 0 {
      itemViewModel.amount = 0
    }
    countLabel.text = "\(itemViewModel.amount)"
    onItemModified?(itemViewModel)
  }

  // MARK: - Actions
  @IBAction func itemAdded() {
    itemAmountChanged(amount: 1)
  }

  @IBAction func itemRemoved() {
    itemAmountChanged(amount: -1)
  }

}
