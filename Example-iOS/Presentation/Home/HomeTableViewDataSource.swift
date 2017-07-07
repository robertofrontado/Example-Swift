//
//  HomeTableViewDataSource.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import OkDataSources

class HomeTableViewDataSource: OkTableViewDataSource<HomeItemViewModel, HomeTableViewCell> {

  var onItemAdded: ((_ item: Item) -> Void)?
  var onItemRemoved: ((_ item: Item) -> Void)?

  init(onItemAdded: ((_ item: Item) -> Void)?, onItemRemoved: ((_ item: Item) -> Void)?) {
    self.onItemAdded = onItemAdded
    self.onItemRemoved = onItemRemoved
    super.init()
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = super.tableView(tableView, cellForRowAt: indexPath) as! HomeTableViewCell
    cell.onItemAdded = onItemAdded
    cell.onItemRemoved = onItemRemoved
    return cell
  }

}
