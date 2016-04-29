//
//  InterfaceController.swift
//  LightsOut WatchKit Extension
//
//  Created by Demick Family on 4/28/16.
//  Copyright © 2016 Ganbaru Games. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var buttons: Array<WKInterfaceButton>!
    var state: Array<Bool> = Array.init(count: 16, repeatedValue: false)

    @IBOutlet var button1: WKInterfaceButton!
    @IBOutlet var button2: WKInterfaceButton!
    @IBOutlet var button3: WKInterfaceButton!
    @IBOutlet var button4: WKInterfaceButton!
    @IBOutlet var button5: WKInterfaceButton!
    @IBOutlet var button6: WKInterfaceButton!
    @IBOutlet var button7: WKInterfaceButton!
    @IBOutlet var button8: WKInterfaceButton!
    @IBOutlet var button9: WKInterfaceButton!
    @IBOutlet var button10: WKInterfaceButton!
    @IBOutlet var button11: WKInterfaceButton!
    @IBOutlet var button12: WKInterfaceButton!
    @IBOutlet var button13: WKInterfaceButton!
    @IBOutlet var button14: WKInterfaceButton!
    @IBOutlet var button15: WKInterfaceButton!
    @IBOutlet var button16: WKInterfaceButton!

    @IBAction func button1Pressed() {
        handleButtonPress(0)
    }
    @IBAction func button2Pressed() {
        handleButtonPress(1)
    }
    @IBAction func button3Pressed() {
        handleButtonPress(2)
    }
    @IBAction func button4Pressed() {
        handleButtonPress(3)
    }
    @IBAction func button5Pressed() {
        handleButtonPress(4)
    }
    @IBAction func button6Pressed() {
        handleButtonPress(5)
    }
    @IBAction func button7Pressed() {
        handleButtonPress(6)
    }
    @IBAction func button8Pressed() {
        handleButtonPress(7)
    }
    @IBAction func button9Pressed() {
        handleButtonPress(8)
    }
    @IBAction func button10Pressed() {
        handleButtonPress(9)
    }
    @IBAction func button11Pressed() {
        handleButtonPress(10)
    }
    @IBAction func button12Pressed() {
        handleButtonPress(11)
    }
    @IBAction func button13Pressed() {
        handleButtonPress(12)
    }
    @IBAction func button14Pressed() {
        handleButtonPress(13)
    }
    @IBAction func button15Pressed() {
        handleButtonPress(14)
    }
    @IBAction func button16Pressed() {
        handleButtonPress(15)
    }

    func handleButtonPress(index: Int) {
        print(index)

        let button: WKInterfaceButton = buttons[index]
        let buttonState: Bool = state[index]

        if buttonState {
            button.setBackgroundColor(UIColor.darkGrayColor())
        } else {
            button.setBackgroundColor(UIColor.magentaColor())
        }

        state[index] = !state[index] // reverse polarity!
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        buttons = Array.init(arrayLiteral: button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11, button12, button13, button14, button15, button16)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
