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
  func currencyPopUp() {

  }

  // MARK: - Pop current screen
  func popCurrentScreen() {
    // Pop if there is a Navigation Controller
    if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController, navigationController.viewControllers.count > 1 {
      navigationController.popViewController(animated: true)
    } else { // If not, dismiss
      UIApplication.topViewController()?.dismiss(animated: true, completion: nil)
    }
  }

  // MARK: - Present Methods
  func presentViewController(_ viewController: UIViewController, animated: Bool) {
    UIApplication.topViewController()!.present(viewController, animated: animated, completion: nil)
  }

  // MARK: - Push Methods
  func pushViewController(_ viewController: UIViewController, animated: Bool) {
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
