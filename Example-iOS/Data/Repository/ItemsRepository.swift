//
//  ItemsRepository.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

class ItemsRepository: BaseRepository {

  override init(api: API) {
    super.init(api: api)
  }

  func getItems(onCompletion: @escaping (_ items: [Item], _ error: Error?) -> Void) {
    api.getItems(onCompletion: onCompletion)
  }
  
}
