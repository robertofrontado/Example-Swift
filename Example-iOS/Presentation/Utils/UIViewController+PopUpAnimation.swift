//
//  UIViewController+PopUpAnimation.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/8/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit

extension UIViewController {

  internal func modifyView(alpha: CGFloat, scaleXY: CGFloat) {
    self.view.transform = CGAffineTransform(scaleX: scaleXY, y: scaleXY)
    self.view.alpha = alpha
  }

  func showPopUpAnimation() {
    self.modifyView(alpha: 0.0, scaleXY: 1.3)
    self.view.layoutIfNeeded()
    UIView.animate(withDuration: 0.3, animations: {
      self.modifyView(alpha: 1.0, scaleXY: 1.0)
    })
  }

  func hidePopUpAnimation(onCompletion: (() -> Void)?) {
    UIView.animate(withDuration: 0.3, animations: {
      self.modifyView(alpha: 0.0, scaleXY: 1.3)
    }, completion: { _  in
      onCompletion?()
    })
  }

}
