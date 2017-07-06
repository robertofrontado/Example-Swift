//
//  UIStoryboard+getViewController.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit

extension UIStoryboard {
  // The view controller's identifier MUST match with the class name, otherwise it will returns nil
  class func getViewController<T>(_ storyboard: String, clazz: T.Type) -> T? {
    let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
    return storyboard.instantiateViewController(withIdentifier: String(describing: clazz)) as? T
  }
}
