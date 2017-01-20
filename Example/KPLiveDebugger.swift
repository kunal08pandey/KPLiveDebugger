//
//  KPLiveDebugger.swift
//  KPLiveDebugger
//
//  Created by Kunal Pandey on 1/20/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import KPLiveDebugger

let log = KPLogger.self

public func print(items: Any..., separator: String = " ", terminator: String = "\n") {
    #if LDEBUG
        KPLiveDebugger.print(items, separator: separator, terminator: terminator)
    #else
        Swift.print(items, separator: separator, terminator: terminator)
    #endif
}
