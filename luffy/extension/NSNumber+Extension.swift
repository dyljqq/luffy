//
//  NSNumber+Extension.swift
//  luffy
//
//  Created by 季勤强 on 2020/4/29.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

extension NSNumber {
    var isBool: Bool { return CFBooleanGetTypeID() == CFGetTypeID(self) }
}
