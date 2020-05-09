//
//  URLConvertible.swift
//  luffy
//
//  Created by 季勤强 on 2020/4/28.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

public enum LFError: Error {
  
  case invalidURL(url: URLConvertible)
  
}

public protocol URLConvertible {
  
  func asURL() throws -> URL
  
}
