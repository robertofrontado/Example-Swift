//
//  BaseViewController.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import UIKit
import PKHUD

class BaseViewController<P: BasePresenter>: UIViewController, BaseView {

  typealias Presenter = P

  var presenter: Presenter!
  var wireframe: Wireframe!

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.attachView(view: self)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.attachView(view: self)
  }

  // MARK: - BaseView
  func showLoading() {
    HUD.show(.progress)
  }

  func hideLoading(){
    HUD.hide()
  }

  func showMessage(message: String) {
    let alert = UIAlertController(title: message, message: nil, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
    present(alert, animated: true, completion: nil)
  }

  func showError(error: Error) {
    showMessage(message: error.localizedDescription)
  }
}
