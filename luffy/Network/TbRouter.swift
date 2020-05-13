//
//  TbRouter.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/12.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

enum TbRouter {
  case itemInfo(_ itemId: Int)
}

extension TbRouter: URLRequestConvertible {
  
  var baseURLString: String {
    return "http://h5api.m.taobao.com"
  }
  
  var path: String {
    switch self {
    case .itemInfo:
      return "/h5/mtop.taobao.detail.getdetail/6.0/"
    }
  }
  
  var headers: [String: String] {
    var headers = [
      "Accept": "*/*",
      "Accept-Language": "zh-CN",
      "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) FxiOS/10.6b8836 Mobile/14G60 Safari/603.3.8",
    ]
    switch self {
    case .itemInfo(let itemId):
      headers["Referer"] = "https://detail.m.tmall.com/item.htm?spm=a220m.6910245.0.0.55b17434eiwv4f&id=\(itemId)"
    }
    return headers
  }
  
  var params: Parameters {
    switch self {
    case .itemInfo(let itemId):
      let timestamp = Date().timeIntervalSince1970
      let dict = [
        "itemNumId": "\(itemId)",
        "itemId": "\(itemId)",
        "exParams": "{\"id\": \"\(itemId)\"}",
        "detail_v": "8.0.0",
        "utdid": "1"
      ]
      let data = try! JSONSerialization.data(withJSONObject: dict, options: [])
      let str = String(data: data, encoding: .utf8)!

      return [
        "jsv": "2.5.7",
        "appKey": 12574478,
        "t": timestamp,
        "sign": "7c9e1dedaa295fdb175d22c99746493b",
        "api": "mtop.taobao.detail.getdetail",
        "v": "6.0",
        "ttid": "2018@taobao_h5_9.9.9",
        "type": "json",
        "dataType": "json",
        "data": str
      ]
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .itemInfo:
      return .get
    }
  }
  
}
