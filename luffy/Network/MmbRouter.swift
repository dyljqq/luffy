//
//  MmbRouter.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/9.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

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

enum MmbRouter {
  case getHistoryTrend(_ itemUrl: String)
}

extension MmbRouter: URLRequestConvertible {
  
  static let baseURL = "https://apapia-history.manmanbuy.com"
  
  var headers: [String: String] {
    return [
        "Host": "apapia-history.manmanbuy.com",
        "Content-Type": "application/x-www-form-urlencoded; charset=utf-8",
        "Proxy-Connection": "close",
        "Cookie": "jjkcpnew111=cp7483681_60186187239_2020/4/28",
        "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 13_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 - mmbWebBrowse - ios",
        "Content-Length": "948",
        "Accept-Encoding": "gzip",
        "Connection": "keep-alive",
    ]
  }
  
  var path: String {
    switch self {
    case .getHistoryTrend:
      return "/ChromeWidgetServices/WidgetServices.ashx"
    }
  }
  
  var parameters: Parameters {
    switch self {
    case .getHistoryTrend(let itemUrl):
      return [
        "methodName": "getHistoryTrend",
        "jsoncallback": "%3F",
        "p_url": raw(itemUrl),
        "qs": "true",
        "bj": "false",
        "jgzspic": "no",
        "callPos": "trend_detail",
        "t": "1588660707180",
        "username": "",
        "u_name": "",
        "sign": "",
        "c_appver": "3.3.40",
        "c_ostype": "ios",
        "c_osver": "13.3.1",
        "c_devid": "71A13FAE-A76A-49F9-987D-83FB3F852134",
        "c_patch": "v19",
        "c_devmodel": "iPhone%20XS%20Max",
        "c_brand": "Apple",
        "c_operator": "=%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8",
        "c_ctrl": "TrendDetailScene",
        "c_win": "w_414_h_896",
        "c_dp": "1",
        "c_safearea": "44_34",
        "c_firstchannel": "AppStore",
        "c_firstquerendate": "1588077601005",
        "c_channel": "AppStore"
      ]
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .getHistoryTrend:
      return .post
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    let urlString = MmbRouter.baseURL + self.path
    guard let url = try? urlString.asURL() else {
      throw LFError.invalidURL(url: urlString)
    }
    var req = URLRequest(url: url)
    req.allHTTPHeaderFields = headers
    req.httpMethod = self.method.rawValue
    req.timeoutInterval = TimeInterval(5)
    req.httpBody = parameters.percentEncoded()
    return req
  }
}
