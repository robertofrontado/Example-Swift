//
//  DomainModule.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/9/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Swinject
import Moya

class DomainModule {

  static func setup(_ defaultContainer: Container) {

    defaultContainer.register(Transformations.self) { r in
      TransformationsBehavior()
    }
  }
}
