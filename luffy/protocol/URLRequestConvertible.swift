//
//  URLRequestConvertible.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/9.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {
  
  var baseURLString: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var params: Parameters { get }
  var headers: [String: String] { get }
  
  func asURLRequest() throws -> URLRequest
  
}

extension URLRequestConvertible {
  
  func asURLRequest() throws -> URLRequest {
    let urlString = self.baseURLString + self.path
    guard let url = try? urlString.asURL() else {
      throw LFError.invalidURL(url: urlString)
    }
    var req = URLRequest(url: url)
    req.allHTTPHeaderFields = self.headers
    req.httpMethod = self.method.rawValue
    req.timeoutInterval = TimeInterval(5)
    switch self.method {
    case .get:
      req = URLEncoding.shared.encode(req, with: self.params)
    case .post:
      req.httpBody = params.percentEncoded()
    default:
      break
    }
    return req
  }
  
}
