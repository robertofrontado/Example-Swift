//
//  BaseView.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

protocol BaseView: class {
  func showLoading()
  func hideLoading()
  func showMessage(message: String)
  func showError(error: Error)
}
