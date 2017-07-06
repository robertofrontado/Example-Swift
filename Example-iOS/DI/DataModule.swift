//
//  DataModule.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Swinject

class DataModule {

  static func setup(_ defaultContainer: Container) {

    // MARK: - API
    defaultContainer.register(API.self) { _ in RestAPI() }

    // MARK: - Repository
    defaultContainer.register(ItemsRepository.self) { r in
      ItemsRepository(api: r.resolve(API.self)!)
    }

    defaultContainer.register(CurrencyRepository.self) { r in
      CurrencyRepository(api: r.resolve(API.self)!)
    }

  }
}
