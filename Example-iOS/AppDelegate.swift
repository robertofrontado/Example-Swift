//
//  AppDelegate.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // UINavigationBar appearance
    UINavigationBar.appearance().barTintColor = UIColor.orange
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    return true
  }


}

