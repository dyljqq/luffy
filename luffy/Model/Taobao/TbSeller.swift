//
//  TbSeller.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/13.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

struct TbSeller: Codable {
  
  struct Evaluate: Codable {
    let title: String
    let score: String
    let level: String
    let levelText: String
  }
  
  let shopId: String
  let shopName: String
  let shopIcon: String
  let taobaoShopUrl: String
  let evaluates: [Evaluate]
  
  enum CodingKeys: String, CodingKey {
    case shopId
    case shopName
    case shopIcon
    case evaluates
    case taobaoShopUrl = "taoShopUrl"
  }
  
}
