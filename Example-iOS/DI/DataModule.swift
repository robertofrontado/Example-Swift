//
//  DataModule.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Swinject
import Moya

class DataModule {

  static func setup(_ defaultContainer: Container) {

    // MARK: - Repository
    defaultContainer.register(ItemsRepository.self) { r in
      ItemsRepository(api: RxMoyaProvider(endpointClosure: getEndpointClosure()),
                      transformations: r.resolve(Transformations.self)!)
    }

    defaultContainer.register(CurrencyRepository.self) { r in
      CurrencyRepository(api: RxMoyaProvider(endpointClosure: getEndpointClosure()),
                         transformations: r.resolve(Transformations.self)!)
    }

    func getEndpointClosure<T: TargetType>() -> ((T) -> Endpoint<T>) {
      return { (target: T) in
        return Endpoint<T>(
          url: "\(target.baseURL.absoluteString)\(target.path)",
          sampleResponseClosure: { .networkResponse(200, target.sampleData) },
          method: target.method,
          parameters: target.parameters)
      }
    }
  }
}
