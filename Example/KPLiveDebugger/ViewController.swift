//
//  ViewController.swift
//  KPLiveDebugger
//
//  Created by Kunal Pandey on 01/20/2017.
//  Copyright (c) 2017 Kunal Pandey. All rights reserved.
//

import UIKit
import KPLiveDebugger

class ViewController: KPDebugViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("This is an example of KPLiveDebugger")
    for i in 0...1000 {
      log.info("Value : \(i + 1)")
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("This is an example of KPLiveDebugger")
  }
}

