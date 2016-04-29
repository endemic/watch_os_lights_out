//
//  WinInterfaceController.swift
//  LightsOut
//
//  Created by Demick, Nathan on 4/29/16.
//  Copyright © 2016 Ganbaru Games. All rights reserved.
//

import WatchKit
import Foundation


class WinInterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let duration = 1.0;
        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64((duration + 0.15) * Double(NSEC_PER_SEC)))
        
        dispatch_after(delay, dispatch_get_main_queue(), {() -> Void in
            self.dismissController()
        })
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
