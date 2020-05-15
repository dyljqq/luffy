//
//  LFNetwork.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/14.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

struct LFNetwork {
  
  static let shared = LFNetwork()
  
  let session = URLSession.shared
  
  let decoder = JSONDecoder()
  
  func request<T: Codable>(_ router: URLRequestConvertible, callback: @escaping (Result<T>) -> ()) {
    guard let req = try? router.asURLRequest() else {
      return
    }
    let task = session.dataTask(with: req) { (data, resp, error) in
      guard let data = data else {
        callback(.failure(error!))
        return
      }
      callback(self.decodeToObject(data))
    }
    task.resume()
  }
  
}

extension LFNetwork {
  
  func decodeToObject<T: Codable>(_ data: Data) -> Result<T> {
    do {
      let v = try decoder.decode(T.self, from: data)
      return .success(v)
    } catch {
      print("error: \(error)")
      return .failure(error)
    }
  }
  
}
