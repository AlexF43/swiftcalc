//
//  Bedmas.swift
//  calc
//
//  Created by Alex Fogg on 8/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

enum Bedmas: Int {
    case add = 0
    case sub = 1
    case rem = 2
    case mult = 3
    case div = 4
    
    var operation: String {
        switch self {
        case .add:
            return "+"
        case .sub:
            return "-"
        case .rem:
            return "%"
        case .mult:
            return "x"
        case .div:
            return "/"
        }
    }
    
    func performOperation(val1: Int, val2: Int) -> Int {
        switch self {
        case .add:
            return val1 + val2;
        case .sub:
            return val1 - val2;
        case .mult:
            return val1 * val2;
        case .div:
            return val1 / val2;
        case .rem:
            return val1 % val2;
        }
    }
    
    init?(symbol: String) {
        switch symbol {
        case "+":
            self = .add
        case "-":
            self = .sub
        case "%":
            self = .rem
        case "x":
            self = .mult
        case "/":
            self = .div
        default:
            return nil
        }
    }
}
