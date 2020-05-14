//
//  ViewController.swift
//  luffy
//
//  Created by 季勤强 on 2020/4/28.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .red
    
//    let url = "https://detail.taobao.com/item.htm?id=594359473626"
//    ManManBuy.shared.getHistoryTrend(url: url) { result in
//      let decoder = JSONDecoder()
//      guard let single = result["single"] as? [String: Any],
//        let data = try? JSONSerialization.data(withJSONObject: single, options: []) else {
//          print("parse error...")
//        return
//      }
//
//      do {
//        let info = try decoder.decode(MmbHistoryitemInfo.self, from: data)
//        print(info)
//      } catch {
//        print("\(error)")
//      }
//    }
    
    let itemId = 585778931802
    TbItemFetcher.shared.getTbItemInfo(itemId: itemId) { d in
      let decoder = JSONDecoder()
      guard let d = d["data"] as? [String: Any],
        let data = try? JSONSerialization.data(withJSONObject: d, options: []) else {
        return
      }
      do {
        let info = try decoder.decode(TbItemInfo.self, from: data)
        print(info)
      } catch {
        print(error)
      }
    }
  }


}

