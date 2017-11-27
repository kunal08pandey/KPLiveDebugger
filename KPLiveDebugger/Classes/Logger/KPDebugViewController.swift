//
//  KPDebugViewController.swift
//  Pods
//
//  Created by Kunal Pandey on 1/20/17.
//
//

import UIKit

open class KPDebugViewController: UIViewController {
  
  private var debugGesture:UITapGestureRecognizer?
  override open func viewDidLoad() {
    super.viewDidLoad()
    self.setupDebugEnvironment()
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
  
  @objc func startDebuggging() {
    OnScreenLog.showLogger()
  }
  
}
