//
//  BaseRepository.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Moya

class BaseRepository<T: TargetType> {

  internal let api: RxMoyaProvider<T>
  internal let transformations: Transformations

  init(api: RxMoyaProvider<T>, transformations: Transformations) {
    self.api = api
    self.transformations = transformations
  }
  
}
