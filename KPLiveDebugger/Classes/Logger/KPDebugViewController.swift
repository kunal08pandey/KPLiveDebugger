//
//  KPDebugViewController.swift
//  Pods
//
//  Created by Kunal Pandey on 1/20/17.
//
//

import UIKit

public class KPDebugViewController: UIViewController {

    private var debugGesture:UITapGestureRecognizer?
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setupDebugEnvironment()
        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - OnScreen Log Debugging
    func setupDebugEnvironment() {
        #if Distribution
            return
        #else
            debugGesture = UITapGestureRecognizer(target: self, action: #selector(KPDebugViewController.startDebuggging))
            debugGesture?.numberOfTouchesRequired = 2
            debugGesture?.numberOfTapsRequired = 7
            self.view.addGestureRecognizer(debugGesture!)
        #endif
    }
    
    func startDebuggging() {
        OnScreenLog.showLogger()
    }
   
}
