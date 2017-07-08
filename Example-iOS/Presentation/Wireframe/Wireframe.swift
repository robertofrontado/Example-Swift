//
//  Wireframe.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

protocol Wireframe {

  // MARK: - Home
  func home()

  // MARK: - Currency
  func checkout(delegate: CheckoutViewControllerDelegate, price: Float, currency: Currency)

  // MARK: - Pop current screen
  func popCurrentScreen()
  func popCurrentScreen(onCompletion: @escaping () -> Void)
  func popCurrentScreen(animated: Bool)
  func popCurrentScreen(animated: Bool, onCompletion: @escaping () -> Void)

}
