//
//  Color.swift
//  luffy
//
//  Created by 季勤强 on 2020/5/16.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import UIKit

func UIColorFromRGB(_ rgbValue: UInt, alpha: CGFloat = 1.0) -> UIColor {
  return UIColor(
    red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
    green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
    blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
    alpha: alpha
  )
}

struct Color {
  static let backgroundColor = UIColorFromRGB(0xf5f5f5)
  static let textColor = UIColorFromRGB(0x43240c)
  static let borderColor = UIColorFromRGB(0x877a73)
}
