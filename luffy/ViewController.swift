//
//  ViewController.swift
//  luffy
//
//  Created by 季勤强 on 2020/4/28.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var searchBar: LFSearchBar = {
    let searchBar = LFSearchBar()
    return searchBar
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = Color.backgroundColor
    
//    let url = "https://detail.taobao.com/item.htm?id=594359473626"
    let url = "https://detail.tmall.com/item.htm?id=585556218795&skuId=4184583576582"
    
    let itemId = 585556218795
    TbItemFetcher.shared.getTbItemInfo(itemId: itemId) { (item: TbOriginItem?) in
      print(item?.data)
    }
    
    self.navigationItem.titleView = searchBar
    self.navigationItem.titleView?.snp.makeConstraints { make in
      make.leading.equalTo(16)
      make.trailing.equalTo(-16)
      make.top.equalTo(5)
      make.bottom.equalTo(-5)
    }
  }

  func setup() {
    
  }
  
}

