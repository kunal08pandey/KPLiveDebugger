//
//  MSLogger.swift
//  MakaanSeller
//
//  Created by Kunal Pandey on 01/20/2017.
//  Copyright © 2017 Kunal Pandey. All rights reserved.
//

import UIKit
import SwiftyBeaver

var enableOnScreenLog = false

let KPLoggerDidLoggedNotification = "MSLoggerDidLoggedNotification"
public class KPLogger: SwiftyBeaver {
    
    // MARK:- Swifty setup
    class func setup() {
        let console = ConsoleDestination()  // log to Xcode Console
        #if DEBUG
            console.minLevel = MSLogger.Level.Verbose
        #else
            console.minLevel = MSLogger.Level.Error
        #endif
        // swift 2.3 has no colored attribute
//        console.colored = true
        let onScreen = ScreenDestination(delegate: OnScreenLog)
        log.addDestination(console)
        log.addDestination(onScreen)
    }
    
}

class ScreenDestination : BaseDestination {

    override var defaultHashValue: Int {return 3}

    weak var delegate:ScreenLogDelegate?

    init(delegate:ScreenLogDelegate) {
        super.init()
        self.delegate = delegate
    }

    override func send(level: SwiftyBeaver.Level, msg: String, thread: String, path: String, function: String, line: Int) -> String? {
        let formattedString = super.send(level, msg: msg, thread: thread, path: path, function: function, line: line)
        if delegate != nil {
            self.delegate!.logged(formattedString!)
        }
        return formattedString
    }
    
}


protocol ScreenLogDelegate : NSObjectProtocol {
    
    func logged(string:String)
}

func print(items: Any..., separator: String = "", terminator: String = "") {
    #if DEBUG
        log.info(items)
        Swift.print(items, separator: separator, terminator: terminator)
    #endif
}
