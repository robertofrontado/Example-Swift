//
//  TestAppDelegate.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Foundation
import UIKit

class TestAppDelegate: NSObject, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    UIApplication.shared.keyWindow?.layer.speed = 100
    // Create an empty window. Useful for unit tests that might need to alter the view heirarchy or
    // add views during their tests.
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = UIViewController()
    window.makeKeyAndVisible()
    self.window = window
    return false
  }
}
