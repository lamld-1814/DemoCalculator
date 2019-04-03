//
//  ViewController.swift
//  Caculator
//
//  Created by mac on 4/2/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet var btnNumberActions: [UIButton]!
    @IBOutlet var btnCalculation: [UIButton]!
    @IBOutlet weak var btnComma: UIButton!
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var checkCalculation = false
    var checkEqual = false
    var calculation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnNumberActionsClicked(_ sender: UIButton) {
        if checkEqual {
            lbNumber.text = "0"
        }
        
        if checkCalculation == true {
            lbNumber.text = String(sender.tag)
            numberOnScreen = Double(lbNumber.text!)!
            checkCalculation = false
        }else{
            if lbNumber.text == "0"{
                lbNumber.text = ""
            }
            lbNumber.text = lbNumber.text! + String(sender.tag)
            numberOnScreen = Double(lbNumber.text!)!
        }
        
        checkEqual = false
    }
    
    @IBAction func btnACClicked(_ sender: Any) {
        lbNumber.text = "0"
        previousNumber = 0
        numberOnScreen = 0
        calculation = ""
    }

    @IBAction func btnOppositeClicked(_ sender: Any) {
        checkEqual = true
        checkNumber(number: -numberOnScreen)
    }
    
    @IBAction func btnPercentClicked(_ sender: Any) {
        checkEqual = true
        checkNumber(number: numberOnScreen/100)
    }
    
    @IBAction func btnCalculationClicked(_ sender: UIButton) {
        previousNumber = Double(lbNumber.text!)!
        if (self.btnCalculation.firstIndex(of: sender) == 0) {
            calculation = "Divide"
        } else if (self.btnCalculation.firstIndex(of: sender) == 1) {
            calculation = "Multiply"
        }else if (self.btnCalculation.firstIndex(of: sender) == 2) {
            calculation = "Plus"
        }else if (self.btnCalculation.firstIndex(of: sender) == 3) {
            calculation = "Minus"
        }
        checkCalculation = true
    }
    
    @IBAction func btnEqualClicked(_ sender: Any) {
        if calculation == "Divide"{
            checkNumber(number: previousNumber / numberOnScreen)
        } else if calculation == "Multiply"{
            checkNumber(number: previousNumber * numberOnScreen)
        }else if calculation == "Plus"{
            checkNumber(number: previousNumber + numberOnScreen)
        }else if calculation == "Minus"{
            checkNumber(number: previousNumber - numberOnScreen)
        }
        checkEqual = true
    }

    
    @IBAction func btnCommaClicked(_ sender: UIButton) {
        let tempNumber = numberOnScreen - Double(Int(numberOnScreen))
        if tempNumber == 0{
            let digit = sender.titleLabel?.text
            if lbNumber.text == "" || lbNumber.text == "0.0"
                || lbNumber.text == "0.00"
            {
                lbNumber.text = digit
            } else {
                if lbNumber.text!.contains(".") {
                    return
                }else{
                    lbNumber.text = lbNumber.text! + digit!
                }
            }
            numberOnScreen = Double(lbNumber.text!)!
        }
        checkEqual = false
    }
    
    func checkNumber(number : Double){
        let tempNumber = number - Double(Int(number))
        if tempNumber == 0 {
            lbNumber.text = String(Int(number))
        } else{
            lbNumber.text = String(number)
        }
        numberOnScreen = Double(lbNumber.text!)!
    }
    

}

