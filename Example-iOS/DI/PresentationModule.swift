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

    // MARK: - Home
    defaultContainer.register(HomePresenter.self) { r in
      HomePresenter(itemsRepository: r.resolve(ItemsRepository.self)!)
    }

  }

  static func resolveViewControllers(_ defaultContainer: Container) {

    // MARK: - Home
    defaultContainer.storyboardInitCompleted(HomeViewController.self) { r, c in
      c.presenter = r.resolve(HomePresenter.self)!
    }
  }
}
