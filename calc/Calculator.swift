//
//  Calculator.swift
//  calc
//
//  Created by Alex Fogg on 6/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation


func completeOperaton(currentOperator: (operation: String, index: Int), equation: [String]) -> [String] {
    var operationResult:Int
    
    switch(currentOperator.operation) {
    case "+":
        operationResult = (Int(equation[currentOperator.index - 1])!) + (Int(equation[currentOperator.index + 1])!);
    case "-":
        operationResult = (Int(equation[currentOperator.index - 1])!) - (Int(equation[currentOperator.index + 1])!);
    case "x":
        operationResult = (Int(equation[currentOperator.index - 1])!) * (Int(equation[currentOperator.index + 1])!);
    case "/":
        operationResult = (Int(equation[currentOperator.index - 1])!) / (Int(equation[currentOperator.index + 1])!);
    case "%":
        operationResult = (Int(equation[currentOperator.index - 1])!) % (Int(equation[currentOperator.index + 1])!);
    default:
        operationResult = 0
    }
    var newEquation = equation
    newEquation.remove(at: currentOperator.index + 1)
    newEquation.remove(at: currentOperator.index - 1)
    newEquation[currentOperator.index - 1] = String(operationResult)
    return newEquation
    
}

func calculate(equation: [String]){

    let bedmasOperations = ["+": 0, "-": 1, "%": 2, "x": 3, "/": 4]
    var currentOperation = (operation: equation[1], index: 1)
    for i in stride(from: 3, to: equation.count, by: 2) {
        if (bedmasOperations[equation[i]] ?? 0 > bedmasOperations[currentOperation.operation] ?? 0) {
            currentOperation = (equation[i], i)
        }
    }
    
    let newEquation = completeOperaton(currentOperator: currentOperation, equation: equation)
    
    guard (newEquation.count == 1) else {
        calculate(equation: newEquation)
        return
    }
    
    print(newEquation[0])
}
