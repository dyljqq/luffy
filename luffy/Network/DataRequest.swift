//
//  DataRequest.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/14.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

struct DataRequest {
  
  var completionHandler: ((Data?, URLResponse?, Error?) -> Void)? = nil
  
  let session: URLSession
//  var task: URLSessionTask? { return delegate.task }
//  var request: URLRequest? { return task?.originalRequest }
  
  let taskDelegateLock = NSLock()
//
//  var delegate: TaskDelegate {
//
//    get {
//      taskDelegateLock.lock(); defer { taskDelegateLock.unlock() }
//      return taskDelegate
//    }
//
//    set {
//      taskDelegateLock.lock(); defer { taskDelegateLock.unlock() }
//      taskDelegate = newValue
//    }
//
//  }
//
//  private var taskDelegate: TaskDelegate
  
  init(session: URLSession, error: Error? = nil) {
    self.session = session
//
//    delegate.error = error
  }
}

extension DataRequest {
  
//  static func decodeObjectSeriallize<T: Decodable>(_ decoder: JSONDecoder) -> DataResponseSerialize<T> {
//    return DataResponseSerialize { _, response, data, error in
//      if let error = error {
//        print("error: \(error)")
//        return .failure(error)
//      }
//      return decodeToObject(decoder: decoder, response: response, data: data)
//    }
//  }
//
//  private static func decodeToObject<T: Decodable>(decoder: JSONDecoder, response: HTTPURLResponse?, data: Data?) -> Result<T> {
//    let result = DataRequest.serializeResponseData(response: response, data: data, error: nil)
//
//    switch result {
//    case .success(let data):
//      do {
//        let object = try decoder.decode(T.self, from: data)
//        return .success(object)
//      } catch {
//        print("parse error: \(error)")
//        return .failure(error)
//      }
//    case .failure(let error):
//      return .failure(error)
//    }
//  }
//
//  func responseDecodableObject<T: Decodable>(decoder: JSONDecoder = JSONDecoder(), completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
//
//  }

}
