//
//  LFSearchBar.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/16.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import UIKit
import SnapKit

class LFSearchBar: UIView {
  
  lazy var iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
    imageView.image = UIImage(named: "icon_search")
    return imageView
  }()
  
  lazy var textField: UITextField = {
    let textField = UITextField()
    textField.textColor = Color.textColor
    textField.placeholder = "请输入要搜索的内容..."
    textField.font = UIFont.systemFont(ofSize: 14)
    return textField
  }()
  
  lazy var leftView: UIView = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 28, height: 28))
    return view
  }()
  
  convenience init() {
    self.init(frame: CGRect.zero)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setup()
  }
  
  func setup() {
    
    layer.cornerRadius = 4
    layer.borderWidth = 1
    layer.borderColor = Color.borderColor.cgColor
    
    addSubview(self.textField)
    self.leftView.addSubview(self.iconImageView)
    self.textField.leftView = self.leftView
    self.textField.leftViewMode = .always
    
    textField.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
