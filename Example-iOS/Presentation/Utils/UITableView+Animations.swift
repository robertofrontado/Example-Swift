//
//  UITableView+Animations.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit

extension UITableView {
  func reloadData(with animation: UITableViewRowAnimation) {
    reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
  }
}
