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
  
  func getTbItemInfo(itemId: Int) throws {
    guard let req = try? TbRouter.itemInfo(itemId).asURLRequest() else {
      throw LFError.invalidURLRequest
    }
    let task = URLSession.shared.dataTask(with: req) { data, response, error in
      guard let data = data else {
        if let error = error {
          print("network error: \(error)")
        }
        return
      }
      if let r = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
        print("result: \(r)")
      }
    }
    task.resume()
  }
  
}