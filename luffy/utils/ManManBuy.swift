//
//  ManManBuy.swift
//  luffy
//
//  Created by 季勤强 on 2020/4/28.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

enum URLPath {
  case widgetServices
}

extension URLPath {
  var path: String {
    switch self {
    case .widgetServices:
      return "/ChromeWidgetServices/WidgetServices.ashx"
    }
  }
}

fileprivate func raw(_ text: String) -> String {
  let d = [
    "/": "%252F",
    "?": "%253F",
    "=": "%253D",
    ":": "%253A",
    "&": "%26"
  ]
  return text.map { d[String($0)] ?? String($0) }.joined()
}

struct ManManBuy {
  
  static var shared: ManManBuy { return ManManBuy() }
  
  init() {
    
  }
  
  func getHistoryTrend(url: String, callback: @escaping ([String: Any]) -> ()) {
    guard let req = try? MmbRouter.getHistoryTrend(url).asURLRequest() else {
      return
    }
    let task = URLSession.shared.dataTask(with: req) { data, response, error in
      guard let data = data else {
        if let error = error {
          print("error: \(error)")
        }
        return
      }
      if let result = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] {
        callback(result)
      }
    }
    task.resume()
  }
  
}
