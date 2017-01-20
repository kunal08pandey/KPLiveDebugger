//
//  MSLoggerController.swift
//  MakaanSeller
//
//  Created by Kunal Pandey on 01/20/2017.
//  Copyright © 2017 Kunal Pandey. All rights reserved.
//

import UIKit


let OnScreenLog = MSLoggerController.defaultController()

class MSLoggerController: UIViewController,ScreenLogDelegate {

    private var debugTextView:UITextView!
    private var crossButton:UIButton!
    private var clearButton:UIButton!
    private static var controller:MSLoggerController!
 
    class func defaultController()->MSLoggerController {
        if controller == nil {
            controller = MSLoggerController()
            controller.debugTextView = controller.getDebugTextView()
            controller.crossButton = controller.getCrossButton()
            controller.clearButton = controller.getClearButton()
            controller.view.addSubview(controller.debugTextView)
            controller.view.addSubview(controller.crossButton)
            controller.view.addSubview(controller.clearButton)
            controller.view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        }
        controller.view.frame = CGRect(x: 0, y: 0, width: controller.view.width, height: controller.view.height - TabBarHeight)
        return controller
    }
    
    func showLogger() {
        UIApplication.sharedApplication().keyWindow?.addSubview(OnScreenLog.view)
    }
    
    
    func getDebugTextView()->UITextView {
        if debugTextView == nil {
            debugTextView = UITextView(frame: CGRect(x: 50, y: 50, width: self.view.width - 100, height: self.view.height - 100))
            debugTextView.editable = false
        }
        return debugTextView
    }
    
    func getCrossButton()->UIButton {
        if crossButton == nil{
            crossButton = UIButton(type: .Custom)
            crossButton.frame = CGRect(x: self.view.width - 54, y: 10, width: 44, height: 44)
            crossButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            crossButton.addTarget(self, action: #selector(MSLoggerController.dismiss), forControlEvents: UIControlEvents.TouchUpInside)
            crossButton.setTitle("X", forState: UIControlState.Normal)
        }
        return crossButton
    }
    
    func getClearButton()->UIButton {
        if clearButton == nil{
            clearButton = UIButton(type: .Custom)
            clearButton.frame = CGRect(x: 0, y: 10, width: 74, height: 44)
            clearButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            clearButton.addTarget(self, action: #selector(MSLoggerController.clearLogs), forControlEvents: UIControlEvents.TouchUpInside)
            clearButton.setTitle("clear", forState: UIControlState.Normal)
        }
        return clearButton
    }

    func clearLogs() {
        self.debugTextView.text = ""
    }
    
    
    func dismiss() {
        self.view.removeFromSuperview()
    }
    
    //MARK:- Onscreen Debugging
    func logged(string: String) {
        weak var weakSelf = self
        dispatch_async(dispatch_get_main_queue()) {
            weakSelf?.debugTextView.insertText(string)
        }
    }

}
