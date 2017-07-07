//
//  MockHomeView.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

@testable import Example_iOS

class MockHomeView: MockBaseView, HomeView {

  var getItemsCompletedCalled = false

  func getItemsCompleted(items: [Item]) {
    getItemsCompletedCalled = true
  }

}
