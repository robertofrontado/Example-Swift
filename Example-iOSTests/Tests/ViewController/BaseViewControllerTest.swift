//
//  BaseViewControllerTest.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Quick
import Nimble
@testable import Example_iOS

class BaseViewControllerTest: QuickSpec {

  // Trigger Alert Action
  typealias AlertHandler = @convention(block) (UIAlertAction) -> Void

  func triggerAction(withTitle title: String) {
    let rootVc = UIApplication.shared.keyWindow?.rootViewController
    guard let alertController = rootVc?.presentedViewController as? UIAlertController else {
      return
    }

    let action = alertController.actions.filter { $0.title == title }.first!
    let handler = getActionHandler(action: action)
    handler!(action)
  }

  private func getActionHandler(action: UIAlertAction) -> AlertHandler? {
    if let block = action.value(forKey: "handler") {
      let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
      return unsafeBitCast(blockPtr, to: AlertHandler.self)
    }
    return nil
  }

  func checkIfAlertViewIsShown(title: String, message: String? = nil, actionsTitles: [String]) -> Bool {
    let rootVc = UIApplication.shared.keyWindow?.rootViewController
    guard let alert = rootVc?.presentedViewController as? UIAlertController else {
      return false
    }

    if alert.title != title {
      return false
    }

    if alert.message != message {
      return false
    }

    let titles = alert.actions.map { $0.title }

    if titles.count != actionsTitles.count {
      return false
    }

    for title in titles {
      if !actionsTitles.contains(title!) {
        return false
      }
    }
    return true
  }
}
