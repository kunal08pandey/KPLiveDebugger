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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("This is an example of KPLiveDebugger")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

