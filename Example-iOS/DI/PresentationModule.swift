//
//  PresentationModule.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Swinject

class PresentationModule {

  static func setup(_ defaultContainer: Container) {

    defaultContainer.register(Wireframe.self) { _ in WireframeImpl() }

    resolvePresenters(defaultContainer)
    resolveViewControllers(defaultContainer)
  }

  static func resolvePresenters(_ defaultContainer: Container) {

    defaultContainer.register(BasePresenter.self) { r in
      BasePresenter()
    }

    // MARK: - Home
    defaultContainer.register(HomePresenter.self) { r in
      HomePresenter(itemsRepository: r.resolve(ItemsRepository.self)!)
    }

    // MARK: - Checkout
    defaultContainer.register(CheckoutPresenter.self) { r in
      CheckoutPresenter(currencyRepository: r.resolve(CurrencyRepository.self)!)
    }
  }

  static func resolveViewControllers(_ defaultContainer: Container) {

    // To make your life easier
    func register<P: BasePresenter, V: BaseViewController<P>> (vc: V.Type, p: P.Type = V.Presenter.self) where V.Presenter == P {
      defaultContainer.storyboardInitCompleted(V.self) { r, c in
        c.presenter = r.resolve(V.Presenter.self)!
        c.wireframe = r.resolve(Wireframe.self)!
      }
    }

    // MARK: - Splash
    register(vc: SplashViewController.self)

    // MARK: - Home
    register(vc: HomeViewController.self)

    // MARK: - Checkout
    register(vc: CheckoutViewController.self)
  }
}
