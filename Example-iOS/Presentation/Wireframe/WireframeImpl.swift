//
//  WireframeImpl.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit

class WireframeImpl: Wireframe {

  // MARK: - Home
  func home() {
    let vc = UIStoryboard.getViewController("Home", clazz: HomeViewController.self)!
    let nvc = UINavigationController(rootViewController: vc)
    pushViewController(nvc, animated: true)
  }

  // MARK: - Currency
  func checkout(delegate: CheckoutViewControllerDelegate, price: Float, currency: Currency) {
    let vc = UIStoryboard.getViewController("Checkout", clazz: CheckoutViewController.self)!
    vc.delegate = delegate
    vc.originalPrice = price
    vc.currentPrice = price
    vc.originalCurrency = currency
    vc.currency = currency
    presentViewController(vc, animated: false)
  }

  // MARK: - Pop current screen
  func popCurrentScreen() {
    popCurrentScreen(animated: true)
  }
  
  func popCurrentScreen(onCompletion: @escaping() -> Void) {
    popCurrentScreen(animated: true) { }
  }

  func popCurrentScreen(animated: Bool) {
    popCurrentScreen(animated: animated) { }
  }

  func popCurrentScreen(animated: Bool, onCompletion: @escaping () -> Void) {
    // Pop if there is a Navigation Controller
    if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController, navigationController.viewControllers.count > 1 {
      navigationController.popViewController(animated: animated, completion: onCompletion)
    } else { // If not, dismiss
      UIApplication.topViewController()?.dismiss(animated: animated, completion: onCompletion)
    }
  }

  // MARK: - Private Methods
  // MARK: Present Methods
  internal func presentViewController(_ viewController: UIViewController, animated: Bool) {
    UIApplication.topViewController()!.present(viewController, animated: animated, completion: nil)
  }

  // MARK: Push Methods
  internal func pushViewController(_ viewController: UIViewController, animated: Bool) {
    // Push if there is a Navigation Controller
    if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController {
      if let viewControllerNVC = viewController as? UINavigationController,
        let firstViewController = viewControllerNVC.viewControllers.first {
        navigationController.pushViewController(firstViewController, animated: animated)
      } else {
        navigationController.pushViewController(viewController, animated: animated)
      }
    } else { // If not, Present
      presentViewController(viewController, animated: animated)
    }
  }
}
