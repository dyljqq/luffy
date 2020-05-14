//
//  TbItem.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/13.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

struct TbItem: Codable {
  
  let itemId: String
  let title: String
//  let subtitle: String
  let categoryId: String
  let commentCount: String
  let favcount: String
  let images: [String]
  
}
