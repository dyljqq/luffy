//
//  URLRequestConvertible.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/9.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {
  
  func asURLRequest() throws -> URLRequest
  
}
