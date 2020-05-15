//
//  TbItemFetcher.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/12.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

struct TbItemFetcher {
  
  static let shared: TbItemFetcher = TbItemFetcher()
  
  func getTbItemInfo<T: Codable>(itemId: Int, callback: @escaping (T?) -> ()) {
    LFNetwork.shared.request(TbRouter.itemInfo(itemId)) { (result: Result<T>) in
      switch result {
      case .success(let value):
        callback(value)
      case .failure(let error):
        print("error: \(error)")
      }
    }
  }
  
}
