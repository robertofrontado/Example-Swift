//
//  ApplicationModule.swift
//  Example-iOS
//
//  Created by Roberto Frontado on 7/7/17.
//  Copyright © 2017 Roberto Frontado. All rights reserved.
//

import SwinjectStoryboard

extension SwinjectStoryboard {

  class func setup() {
    DataModule.setup(defaultContainer)
    DomainModule.setup(defaultContainer)
    PresentationModule.setup(defaultContainer)
  }
  
}
