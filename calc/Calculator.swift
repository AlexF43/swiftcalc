//
//  Calculator.swift
//  calc
//
//  Created by Alex Fogg on 6/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

class Calculator {
    func completeOperaton(currentOperator: (operation: Bedmas?, index: Int), equation: [String]) -> [String] {
        
        let operationResult = currentOperator.operation?.performOperation(
            val1: (Int(equation[currentOperator.index - 1])!),
            val2: (Int(equation[currentOperator.index + 1])!))
        
        var newEquation = equation
        newEquation.remove(at: currentOperator.index + 1)
        newEquation.remove(at: currentOperator.index - 1)
        newEquation[currentOperator.index - 1] = String(operationResult ?? 0)
        return newEquation
        
    }
    
    func calculate(equation: [String]) {
        
        var currentOperation = (operation: Bedmas(symbol: equation[0]), index: 1)
        for i in stride(from: 3, to: equation.count, by: 2) {
            if (Bedmas(symbol: equation[i])?.rawValue ?? 0 > currentOperation.operation?.rawValue ?? 0) {
                currentOperation = (Bedmas(symbol: equation[i]), i)
            }
        }
        
        let newEquation = completeOperaton(currentOperator: currentOperation, equation: equation)
        
        guard (newEquation.count == 1) else {
            calculate(equation: newEquation)
            return
        }
        
        print(newEquation[0])
    }
}
