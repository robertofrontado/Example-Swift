//
//  UINavigationController+PopCompletion.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit

extension UINavigationController {

  //Same function as "popViewController", but allow us to know when this function ends
  func popViewController(animated: Bool, completion: @escaping () -> Void) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    self.popViewController(animated: animated)
    CATransaction.commit()
  }

  func pushViewController(viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    self.pushViewController(viewController, animated: animated)
    CATransaction.commit()
  }
}
