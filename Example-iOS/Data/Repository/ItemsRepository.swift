//
//  ItemsRepository.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper

class ItemsRepository: BaseRepository<API> {

  override init(api: RxMoyaProvider<API>, transformations: Transformations) {
    super.init(api: api, transformations: transformations)
  }

  func getItems() -> Observable<[Item]> {
    return api.request(.getItems())
      .compose(transformations.handleError())
      .mapArray(Item.self)
  }
  
}
