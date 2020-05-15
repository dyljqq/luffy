//
//  TaskDelegate.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/14.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class TaskDelegate: NSObject {
  
  var data: Data? { return nil }
  
  var error: Error?
  
  let taskLock = NSLock()
  
  var task: URLSessionTask? {
    
    get {
      taskLock.lock(); defer { taskLock.unlock() }
      return _task
    }
    
    set {
      taskLock.lock(); defer { taskLock.unlock() }
      _task = newValue
    }
    
  }
  
  private var _task: URLSessionTask? {
    didSet {}
  }
  
  init(task: URLSessionTask?) {
    _task = task
  }
  
}

class DataTaskRequest: TaskDelegate, URLSessionDataDelegate {
  
  var dataTask: URLSessionDataTask { return task as! URLSessionDataTask }
  
  private var mutableData: Data
  private var expectedContentLength: Int64?
  
  override init(task: URLSessionTask?) {
    self.mutableData = Data()
    
    super.init(task: task)
  }
  
  // Delegate
  var dataTaskDidReceiveResponse: ((URLSession, URLSessionDataTask, URLResponse) -> URLSession.ResponseDisposition)?
  
  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
    expectedContentLength = response.expectedContentLength
    
    var disposition: URLSession.ResponseDisposition = .allow
    if let dataTaskDidReceiveResponse = dataTaskDidReceiveResponse {
      disposition = dataTaskDidReceiveResponse(session, dataTask, response)
    }
    completionHandler(disposition)
  }
  
}
