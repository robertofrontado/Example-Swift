//
//  UIViewController+PreloadView.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit
import XCTest
@testable import Example_iOS

extension UIViewController {

  func preloadView(root: Bool = true) {
    if root {
      UIApplication.shared.keyWindow?.rootViewController = self
    }
    XCTAssertNotNil(self.view)
    self.viewDidLoad()
    RunLoop.main.run(until: Date())
  }

}
