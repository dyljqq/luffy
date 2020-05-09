//
//  URLEncoding.swift
//  luffy
//
//  Created by 季勤强 on 2020/4/28.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

struct URLEncoding {
  
  static var shared: URLEncoding { return URLEncoding() }
  
  func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
      var components: [(String, String)] = []

      if let dictionary = value as? [String: Any] {
          for (nestedKey, value) in dictionary {
              components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
          }
      } else if let array = value as? [Any] {
//          for value in array {
//              components += queryComponents(fromKey: arrayEncoding.encode(key: key), value: value)
//          }
      } else if let value = value as? NSNumber {
//          if value.isBool {
//              components.append((escape(key), escape(boolEncoding.encode(value: value.boolValue))))
//          } else {
//              components.append((escape(key), escape("\(value)")))
//          }
      } else if let bool = value as? Bool {
          components.append((escape(key), escape(bool ? "true" : "false")))
      } else {
          components.append((escape(key), escape("\(value)")))
      }

      return components
  }
  
  public func escape(_ string: String) -> String {
      let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
      let subDelimitersToEncode = "!$&'()*+,;="

      var allowedCharacterSet = CharacterSet.urlQueryAllowed
      allowedCharacterSet.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")

      var escaped = ""

      if #available(iOS 8.3, *) {
          escaped = string.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? string
      } else {
          let batchSize = 50
          var index = string.startIndex

          while index != string.endIndex {
              let startIndex = index
              let endIndex = string.index(index, offsetBy: batchSize, limitedBy: string.endIndex) ?? string.endIndex
              let range = startIndex..<endIndex

              let substring = string[range]

              escaped += substring.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? String(substring)

              index = endIndex
          }
      }

      return escaped
  }
  
  private func query(_ parameters: Parameters) -> String {
      var components: [(String, String)] = []

      for key in parameters.keys.sorted(by: <) {
          let value = parameters[key]!
          components += queryComponents(fromKey: key, value: value)
      }
      return components.map { "\($0)=\($1)" }.joined(separator: "&")
  }
  
  func encode(_ req: URLRequest, with params: Parameters?) -> URLRequest {
    guard let params = params else { return req }
    guard let url = req.url else {
      return req
    }
    var req = req
    if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !params.isEmpty {
      let percentEncodeQuery = (urlComponents.percentEncodedQuery.map { $0 + "&" } ?? "") + query(params)
      urlComponents.percentEncodedQuery = percentEncodeQuery
      req.url = urlComponents.url
    }
    return req
  }
  
}
