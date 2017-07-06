//
//  BaseRepository.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/6/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import Alamofire

protocol API {

  func getItems(onCompletion: @escaping (_ result: Result<[Item]>) -> Void)
  func getCurrenciesConvertionRate()
}
