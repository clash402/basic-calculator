//
//  Calculator.swift
//  basic-calculator
//
//  Created by Josh Courtney on 5/14/21.
//

import Foundation

struct Calculator {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func set(number: Double) {
        self.number = number
    }
    
    mutating func calculate(with symbol: String) -> Double? {
        guard let n = number else { return nil }
        
        switch symbol {
        case "AC":
            return 0
        case "+/-":
            return n * -1
        case "%":
            return n / 100
        case "=":
            return performOperation(n2: n)
        default:
            intermediateCalculation = (n1: n, calcMethod: symbol)
        }
        
        return nil
    }
    
    private func performOperation(n2: Double) -> Double? {
        guard let n1 = intermediateCalculation?.n1 else { return nil }
        guard let operation = intermediateCalculation?.calcMethod else { return nil }
        
        switch operation {
        case "÷":
            return n1 / n2
        case "×":
            return n1 * n2
        case "-":
            return n1 - n2
        case "+":
            return n1 + n2
        default:
            fatalError()
        }
    }
    
}
