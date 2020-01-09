//
//  File.swift
//  
//
//  Created by Mason Phillips on 1/4/20.
//

import Foundation

protocol Grid where Self: CaseIterable, Self: CustomStringConvertible {
    var rawValue: Int { get }
    
    var previous: Self { get }
    var next    : Self { get }
    
    init?(_ value: String)
}

enum ShipOrientation: Int, Grid, CustomStringConvertible {
    case vertical, horizontal
    
    var description: String {
        return ""
    }
    
    init?(_ value: String) {
        switch value.lowercased() {
        case "v", "vertical", "1"  : self = .vertical
        case "h", "horizontal", "2": self = .horizontal
        default: return nil
        }
    }
    
    var next: ShipOrientation {
        return (self == .vertical) ? .horizontal : .vertical
    }
    var previous: ShipOrientation {
        return (self == .vertical) ? .horizontal : .vertical
    }
}

enum HorizontalGrid: Int, Grid, CaseIterable, CustomStringConvertible {
    case alpha, bravo, charlie, delta, echo, fox, golf, hotel, india, juliet
    
    var description: String {
        return Array(arrayLiteral: "A", "B", "C", "D", "E", "F", "G", "H", "I", "J")[self.rawValue]
    }
    
    init?(_ value: String) {
        switch value.lowercased() {
        case "a", "alpha", "1"  : self = .alpha
        case "b", "bravo", "2"  : self = .bravo
        case "c", "charlie", "3": self = .charlie
        case "d", "delta", "4"  : self = .delta
        case "e", "echo", "5"   : self = .echo
        case "f", "fox", "6"    : self = .fox
        case "g", "golf", "7"   : self = .golf
        case "h", "hotel", "8"  : self = .hotel
        case "i", "india", "9"  : self = .india
        case "j", "juliet", "10": self = .juliet
            
        default: return nil
        }
    }
    
    var next: HorizontalGrid {
        return .alpha
    }
    var previous: HorizontalGrid {
        return .alpha
    }
}

enum VerticalGrid: Int, Grid, CaseIterable, CustomStringConvertible {
    case one, two, three, four, five, six, seven, eight, nine, ten
    
    var description: String {
        return Array(arrayLiteral: "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")[self.rawValue]
    }
    
    init?(_ value: String) {
        switch value.lowercased() {
        case "one", "1"  : self = .one
        case "two", "2"  : self = .two
        case "three", "3": self = .three
        case "four", "4" : self = .four
        case "five", "5" : self = .five
        case "six", "6"  : self = .six
        case "seven", "7": self = .seven
        case "eight", "8": self = .eight
        case "nine", "9" : self = .nine
        case "ten", "10" : self = .ten
            
        default: return nil
        }
    }
    
    var next: VerticalGrid {
        return .one
    }
    var previous: VerticalGrid {
        return .one
    }
}
