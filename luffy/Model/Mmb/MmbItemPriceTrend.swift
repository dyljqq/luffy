//
//  MmbItemPriceTrend.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/5.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

struct MmbItemPriceTrend {
  
  let price: Double
  let time: Date?
  let content: String
  
  init(dateString: String, price: String, content: String) {
     self.price = Double(price) ?? 0
     self.time = Date(timeIntervalSince1970: TimeInterval(Int(dateString) ?? 0) / 1000)
     self.content = content
  }
  
}
