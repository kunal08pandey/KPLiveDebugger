//
//  KPLogger.swift
//  KPLiveDebugger
//
//  Created by Kunal Pandey on 01/20/2017.
//  Copyright © 2017 Kunal Pandey. All rights reserved.
//

import UIKit
import SwiftyBeaver

var enableOnScreenLog = false
let KPLoggerDidLoggedNotification = "KPLoggerDidLoggedNotification"
public class KPLogger: SwiftyBeaver {
  
  // MARK:- Swifty setup
  public class func setup() {
    let console = ConsoleDestination()  // log to Xcode Console
    #if DEBUG
      console.minLevel = KPLogger.Level.verbose
    #else
      console.minLevel = KPLogger.Level.error
    #endif
    // swift 2.3 has no colored attribute
    console.useTerminalColors = true
    let onScreen = KPScreenDestination(delegate: OnScreenLog)
    onScreen.minLevel = KPLogger.Level.verbose
    log.addDestination(console)
    log.addDestination(onScreen)
  }
}

class KPScreenDestination : BaseDestination {
  
  override var defaultHashValue: Int {return 3}
  
  weak var delegate:KPScreenLogDelegate?
  
  init(delegate:KPScreenLogDelegate) {
    super.init()
    self.delegate = delegate
  }
  
  open override func send(_ level: SwiftyBeaver.Level, msg: String, thread: String, file: String,
                          function: String, line: Int, context: Any? = nil) -> String? {
    let formattedString = super.send(level, msg: msg, thread: thread, file: file, function: function, line: line)
    if delegate != nil {
      self.delegate!.logged(string: formattedString!)
    }
    return formattedString
  }
}

protocol KPScreenLogDelegate : NSObjectProtocol {
  func logged(string:String)
}

let log = KPLogger.self

public func print(items: Any..., separator: String = " ", terminator: String = "\n") {
  log.info(items)
}
