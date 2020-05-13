//
//  Error.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/12.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

enum LFError: Error {
  
  case invalidURL(url: URLConvertible)
  case invalidURLRequest
  
}
