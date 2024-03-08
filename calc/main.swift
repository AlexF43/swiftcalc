//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst()

//validate input
let calculator = Calculator()
let validator = Validator()

if (validator.validate(args: args)) {
    calculator.calculate(equation: args)
}

// ask about output
// add comments


