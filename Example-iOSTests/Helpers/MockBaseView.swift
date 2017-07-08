//
//  MockBaseView.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

@testable import Example_iOS

class MockBaseView: BaseView {

  var showLoadingCalled = false
  var hideLoadingCalled = false
  var showMessageCalled = false
  var showErrorCalled = false

  func showLoading() {
    showLoadingCalled = true
  }

  func hideLoading() {
    hideLoadingCalled = true
  }

  func showMessage(message: String) {
    showMessageCalled = true
  }

  func showError(error: Error) {
    showErrorCalled = true
  }
}
