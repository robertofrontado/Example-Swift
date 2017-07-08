//
//  HomeTableViewDataSource.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import OkDataSources

class HomeTableViewDataSource: OkTableViewDataSource<HomeItemViewModel, HomeTableViewCell> {

  var onItemModified: ((_ item: HomeItemViewModel) -> Void)?

  init(onItemModified: ((_ item: HomeItemViewModel) -> Void)?) {
    self.onItemModified = onItemModified
    super.init()
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = super.tableView(tableView, cellForRowAt: indexPath) as! HomeTableViewCell
    cell.onItemModified = onItemModified
    return cell
  }

}
