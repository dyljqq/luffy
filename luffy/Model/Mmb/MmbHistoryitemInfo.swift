//
//  MmbHistoryitemInfo.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/5.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

struct MmbHistoryitemInfo: Codable {
  
  let id: String
  let title: String
  let jiagequshiyh: String
  let lowerPrice: Double
  let monthSale: Int
  let image: String

  var priceTrends: [MmbItemPriceTrend] {
    let arr = self.jiagequshiyh.components(separatedBy: CharacterSet(charactersIn: "[,]"))
    guard arr.count % 5 == 0 else { return [] }
    return stride(from: 0, to: arr.count, by: 5).map { MmbItemPriceTrend(dateString: arr[$0 + 1], price: arr[$0 + 2], content: arr[$0 + 3]) }
  }
  
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case jiagequshiyh
    case lowerPrice
    case monthSale
    case image = "bigpic"
  }
  
}
