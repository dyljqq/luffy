//
//  String+Extension.swift
//  luffy
//
//  Created by 季勤强 on 2020/4/28.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

extension String: URLConvertible {
  
  public func asURL() throws -> URL {
    guard let url = URL(string: self) else { throw LFError.invalidURL(url: self) }
    return url
  }
  
}
