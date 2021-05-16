//
//  ViewController.swift
//  basic-calculator
//
//  Created by Josh Courtney on 5/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    private var calculator = Calculator()
    private var isFinishedTypingNumber = true
    private var displayValue: Double {
        get {
            guard let number = Double(resultLabel.text!) else {
                fatalError("Cannot convert resultLabel text into a double")
            }
            return number
        }
        set {
            resultLabel.text = String(newValue)
        }
    }
    
    @IBAction func numberBtnPressed(_ sender: UIButton) {
        guard let numberValue = sender.currentTitle else { return }
        
        if isFinishedTypingNumber {
            resultLabel.text = numberValue
            isFinishedTypingNumber = false
        } else {
            if numberValue == "." {
                let isInt = floor(displayValue) == displayValue
                
                if !isInt {
                    return
                }
            }
            
            resultLabel.text?.append(numberValue)
        }
    }
    
    @IBAction func calcBtnPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.set(number: displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(with: calcMethod) {
                displayValue = result
            }
        }
    }
    
}
