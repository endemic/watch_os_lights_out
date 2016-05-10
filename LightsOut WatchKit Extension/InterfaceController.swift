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
    let gridSize: Int = 4

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
        swapPolarity(index)

        // Reverse polarity of neighbors
        for neighborIndex in [index - gridSize, index - 1, index + 1, index + gridSize] {
            if validNeighbor(index, other: neighborIndex) {
                swapPolarity(neighborIndex)
            }
        }

        if checkForWin() {
            // show "u won, bro" msg
            presentControllerWithName("Win", context: nil)

            resetState()
            generateRandomPuzzle()
        }
    }

    func validNeighbor(index: Int, other: Int) -> Bool {
        var valid = true

        if abs(index - other) == 1 {
            valid = index / gridSize == other / gridSize
        }

        if other < state.startIndex || other >= state.endIndex {
            valid = false
        }

        return valid
    }

    func swapPolarity(index: Int) {
        let button: WKInterfaceButton = buttons[index]
        let buttonState: Bool = state[index]

        if buttonState {
            button.setBackgroundColor(UIColor.darkGrayColor())
        } else {
            button.setBackgroundColor(UIColor.magentaColor())
        }

        state[index] = !state[index] // reverse polarity!
    }

    // check if all state elements === false
    func checkForWin() -> Bool {
        var success: Bool = true
        for value in state {
            if value {
                success = false
            }
        }
        return success
    }

    func resetState() {
        for (index, _) in state.enumerate() {
            state[index] = false
            let button: WKInterfaceButton = buttons[index]
            button.setBackgroundColor(UIColor.darkGrayColor())
        }
    }

    func generateRandomPuzzle() {
        for (index, _) in state.enumerate() {
            if arc4random_uniform(2) == 1 {
                state[index] = true
                let button: WKInterfaceButton = buttons[index]
                button.setBackgroundColor(UIColor.magentaColor())
            }
        }
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        buttons = Array.init(arrayLiteral: button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11, button12, button13, button14, button15, button16)

        generateRandomPuzzle()
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
