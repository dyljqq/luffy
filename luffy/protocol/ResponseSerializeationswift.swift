//
//  ResponseSerializeationswift.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/14.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

protocol DataResponseSerializationProtocol {
  
  associatedtype SerializedObject
  
//  var serializeResponse: (URLRequest?, HTTPURLResponse?, Data?, Error?) -> Result<SerializedObject> { get }
  
}

//struct DataResponseSerialize<Value>: DataResponseSerializationProtocol {
//  
//  typealias SerializedObject = Value
//  
//  var serializeResponse: (URLRequest?, HTTPURLResponse?, Data?, Error?) -> Result<Value>
//
//  init(serializeResponse: @escaping (URLRequest?, HTTPURLResponse?, Data?, Error?) -> Result<Value>) {
//    self.serializeResponse = serializeResponse
//  }
//}

extension DataRequest {
  
  static func serializeResponseData(response: HTTPURLResponse?, data: Data?, error: Error?) -> Result<Data> {
    guard error == nil else {
      return .failure(error!)
    }
    
    if let response = response, emptyDataStatusCodes.contains(response.statusCode) { return .success(Data()) }
    
    guard let validData = data else {
      return .failure(error!)
    }
    return .success(validData)
  }
  
}

extension DataRequest {
  
  @discardableResult
  func response<T: DataResponseSerializationProtocol>(responseSerializer: T, completionHandler: @escaping (DataResponse<T.SerializedObject>) -> Void) -> Self {
    return self
  }
  
}

private let emptyDataStatusCodes: Set<Int> = [204, 205]
