
//
//  main.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//
//  This file is called first on application start, this allows us
//  to run a different appDelegate when running Unit Tests. When
//  running unit tests we don't want the app to run normally as this
//  can collide with the test running and causing app crashes.
//
//  In this case we are especially talking about Core Data where
//  the app context is colliding with the tests context. In the
//  TestingAppDelegate we only initialize Store (creating a context
//  for Core Data).

import UIKit

let isRunningTests = NSClassFromString("XCTestCase") != nil

let appDelegateClass: AnyClass = isRunningTests ? TestAppDelegate.self : AppDelegate.self

let argsCount = Int(CommandLine.argc)
let argsRawPointer = UnsafeMutableRawPointer(CommandLine.unsafeArgv)
let args = argsRawPointer.bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: argsCount)

let appDelegateString = NSStringFromClass(appDelegateClass)

UIApplicationMain(CommandLine.argc,
                  args,
                  nil,
                  appDelegateString
)

