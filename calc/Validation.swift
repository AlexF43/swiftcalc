//
//  Validation.swift
//  calc
//
//  Created by Alex Fogg on 6/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

func equationValidator(args: [String]) -> Bool {
    
    
    guard (completeEquationCheck(args: args)) else {
        exit(1)
    }
    
    guard (isOperationsValidCheck(args: args)) else {
        exit(1)
    }
    
    guard isIntegersValidCheck(args: args) else {
        exit(2)
    }
    
    guard divideByZeroCheck(args: args) else {
        exit(3)
    }
    
    if let number = isSingleNumberCheck(args: args) {
        print(number)
        exit(0)
    }
    
    return true
}


func completeEquationCheck(args: [String])-> Bool {
    if(args.count % 2 == 0) {
        return false
    }
    return true
}

func isSingleNumberCheck(args: [String]) -> String? {
    if args.count == 1, let number = Int(args[0]) {
        return String(number)
    }
    return nil
}

func isIntegersValidCheck(args: [String]) -> Bool {
    for i in stride(from: 0, to: args.count, by: 2) {
        guard Int(args[i]) != nil else {
            return false
        }
    }
    return true
}

func isOperationsValidCheck(args: [String]) -> Bool {
    let validOperations = ["+", "-", "%", "x", "/"]
    for i in stride(from: 1, to: args.count, by: 2) {
        guard validOperations.contains(args[i]) else {
            return false
        }
    }
    return true
}

func divideByZeroCheck(args: [String]) -> Bool {
    for i in stride(from: 1, to: args.count, by: 2) {
        guard args[i] == "/" && args[i + 1] == "0" else {
            return false
        }
    }
    return true
}

