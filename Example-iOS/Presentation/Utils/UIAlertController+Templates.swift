//
//  UIAlertController+Templates.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit

extension UIAlertController {

  class func showAlertOneButton(_ title: String, message: String? = nil, buttonTitle: String, buttonClick: @escaping () -> Void = {}) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { _ in buttonClick() }))
    UIApplication.topViewController()!.present(alert, animated: true, completion: nil)
  }
}
