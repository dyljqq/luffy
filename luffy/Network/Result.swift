//
//  Result.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/14.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

enum Result<Value: Codable> {
  case success(Value)
  case failure(Error)
  
  var isSuccess: Bool {
    switch self {
    case .success:
      return true
    default:
      return false
    }
  }
  
  var value: Value? {
    switch self {
    case .success(let v):
      return v
    default:
      return nil
    }
  }
  
  var error: Error? {
    switch self {
    case .failure(let error):
      return error
    default:
      return nil
    }
  }
  
}
