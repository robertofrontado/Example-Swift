//
//  SplashViewController.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController<BasePresenter> {

  override func viewDidLoad() {
    super.viewDidLoad()

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
      self.wireframe.home()
    }
  }

}
