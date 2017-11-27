//
//  KPLoggerController.swift
//  KPLiveDebugger
//
//  Created by Kunal Pandey on 01/20/2017.
//  Copyright © 2017 Kunal Pandey. All rights reserved.
//

import UIKit


let OnScreenLog = KPLoggerController.defaultController()

class KPLoggerController: UIViewController,KPScreenLogDelegate {
  
  private var debugTextView:UITextView!
  private var crossButton:UIButton!
  private var clearButton:UIButton!
  private static var controller:KPLoggerController!
  
  class func defaultController()->KPLoggerController {
    if controller == nil {
      controller = KPLoggerController()
      controller.debugTextView = controller.getDebugTextView()
      controller.crossButton = controller.getCrossButton()
      controller.clearButton = controller.getClearButton()
      controller.view.addSubview(controller.debugTextView)
      controller.view.addSubview(controller.crossButton)
      controller.view.addSubview(controller.clearButton)
      controller.view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
    }
    controller.view.frame = UIScreen.main.bounds
    return controller
  }
  
  func showLogger() {
    UIApplication.shared.keyWindow?.addSubview(OnScreenLog.view)
  }
  
  
  func getDebugTextView()->UITextView {
    if debugTextView == nil {
      debugTextView = UITextView(frame: CGRect(x: 30, y: 40, width: self.view.frame.size.width - 60, height: self.view.frame.size.height - 80))
      debugTextView.isEditable = false
    }
    return debugTextView
  }
  
  func getCrossButton()->UIButton {
    if crossButton == nil{
      crossButton = UIButton(type: .custom)
      crossButton.frame = CGRect(x: self.view.frame.size.width - 54, y: 10, width: 44, height: 44)
      crossButton.setTitleColor(UIColor.white, for: .normal)
      crossButton.addTarget(self, action: #selector(KPLoggerController.didDismiss), for: .touchUpInside)
      crossButton.setTitle("X", for: .normal)
    }
    return crossButton
  }
  
  func getClearButton()->UIButton {
    if clearButton == nil{
      clearButton = UIButton(type: .custom)
      clearButton.frame = CGRect(x: 0, y: 10, width: 74, height: 44)
      clearButton.setTitleColor(UIColor.white, for: .normal)
      clearButton.addTarget(self, action: #selector(KPLoggerController.clearLogs), for: UIControlEvents.touchUpInside)
      clearButton.setTitle("clear", for: .normal)
    }
    return clearButton
  }
  
  @objc func clearLogs() {
    self.debugTextView.text = ""
  }
  
  @objc func didDismiss() {
    self.view.removeFromSuperview()
  }
  
  //MARK:- Onscreen Debugging
  func logged(string: String) {
    weak var weakSelf = self
    DispatchQueue.main.async {
      weakSelf?.debugTextView.insertText(string)
    }
  }
  
}
