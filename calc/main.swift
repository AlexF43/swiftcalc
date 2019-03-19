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
if (equationValidator(args: args)) {
    calculate(equation: args)
}

// add div zero validator
// add enum for bedmas rules
// ask about output
// add comments


