//
//  File.swift
//  
//
//  Created by Mason Phillips on 1/4/20.
//

import Foundation

struct XYGrid: Equatable, CustomStringConvertible {
    let x: HorizontalGrid
    let y: VerticalGrid
    
    var description: String {
        return "\(x.description)\(y.description)"
    }
    
    init(x: HorizontalGrid, y: VerticalGrid) {
        self.x = x
        self.y = y
    }
}
struct Location {
    let grid       : XYGrid
    let orientation: ShipOrientation
    
    init(_ x: HorizontalGrid, _ y: VerticalGrid, _ orientation: ShipOrientation) {
        self.grid = XYGrid(x: x, y: y)
        self.orientation = orientation
    }
    
    func next() -> Location {
        switch orientation {
        case .horizontal: return Location(grid.x, grid.y.next, orientation)
        case .vertical  : return Location(grid.x.next, grid.y, orientation)
        }
    }
    func previous() -> Location {
        switch orientation {
        case .horizontal: return Location(grid.x.previous, grid.y, orientation)
        case .vertical  : return Location(grid.x, grid.y.previous, orientation)
        }
    }
}

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
        switch self {
        case .alpha  : return .bravo
        case .bravo  : return .charlie
        case .charlie: return .delta
        case .delta  : return .echo
        case .echo   : return .fox
        case .fox    : return .golf
        case .golf   : return .hotel
        case .hotel  : return .india
        case .india  : return .juliet
        case .juliet : return .alpha
        }
    }
    var previous: HorizontalGrid {
        switch self {
        case .alpha  : return .juliet
        case .bravo  : return .alpha
        case .charlie: return .bravo
        case .delta  : return .charlie
        case .echo   : return .delta
        case .fox    : return .echo
        case .golf   : return .fox
        case .hotel  : return .golf
        case .india  : return .hotel
        case .juliet : return .india
        }
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
        switch self {
        case .one  : return .two
        case .two  : return .three
        case .three: return .four
        case .four : return .five
        case .five : return .six
        case .six  : return .seven
        case .seven: return .eight
        case .eight: return .nine
        case .nine : return .ten
        case .ten  : return .one
        }
    }
    var previous: VerticalGrid {
        switch self {
        case .one  : return .ten
        case .two  : return .one
        case .three: return .two
        case .four : return .three
        case .five : return .four
        case .six  : return .five
        case .seven: return .six
        case .eight: return .seven
        case .nine : return .eight
        case .ten  : return .nine
        }
    }
}
