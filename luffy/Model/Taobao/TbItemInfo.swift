//
//  TbItemInfo.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/13.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

struct TbItemInfo: Codable {
  
  struct ApiStack: Codable {
    let name: String
    let value: String
    
    var jsonValue: [String: Any] {
      guard let data = self.value.data(using: .utf8),
        let d = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String] else {
          return [:]
      }
      return d
    }
  }
  
  let item: TbItem
  let seller: TbSeller
  let apiStack: [ApiStack]
  
  var title: String {
    return self.item.title
  }
  
  var itemId: String {
    return self.item.itemId
  }
  
  var coverUrl: String {
    return self.item.images.first ?? ""
  }
  
  var saleNum: String {
    guard let item = self.apiStack.first?.jsonValue["item"] as? [String: String] else {
      return "0"
    }
    return item["sellCount"] ?? "0"
  }
  
}
