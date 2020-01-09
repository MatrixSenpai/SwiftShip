//
//  File.swift
//  
//
//  Created by Mason Phillips on 1/4/20.
//

import Foundation

enum ShipType: Int, CaseIterable {
    case carrier, battleship, cruiser, submarine, destroyer
}

class Ship {
    let name  : String
    let size  : Int
    var health: Int
    
    var location: Location!
    var hit     : [Location] = []
    
    init(name: String, size: Int) {
        self.name = name
        self.size = size
        self.health = size
    }
    
    func askPlacement() {
        print("Place \(name)")
        
        print("Enter A - J")
        let x = getPosition(HorizontalGrid.self)
        
        print("Enter 1 - 10")
        let y = getPosition(VerticalGrid.self)
        
        print("Enter 'v' for vertical or 'h' for horizontal")
        let o = getPosition(ShipOrientation.self)
        
        location = Location(x, y, o)
    }
    
    func getPosition<T: Grid>(_ type: T.Type) -> T {
        while(true) {
            if let input = readLine(), let t = T(input) {
                return t
            } else {
                print("Invalid input. Try again")
            }
        }
    }
    
    func place(letter: HorizontalGrid, number: VerticalGrid, orientation: ShipOrientation) -> Bool {
        if !isWithinBounds(x: letter, y: number, o: orientation) { return false }
        location = Location(letter, number, orientation)
        return true
    }
    
    func isWithinBounds(x: HorizontalGrid, y: VerticalGrid, o: ShipOrientation) -> Bool {
        if o == .horizontal {
            return ((x.rawValue + size) <= 10)
        } else {
            return ((y.rawValue + size) <= 10)
        }
    }
    
    func isInLocation(_ location: XYGrid) -> Bool {
        guard var cl = self.location else { return false }
        for _ in 0..<size {
            if cl.grid == location { return true }
            else {
                cl = cl.next()
            }
        }
        
        return false
    }
}

class Carrier: Ship {
    init() {
        super.init(name: "Carrier", size: 5)
    }
}

class Battleship: Ship {
    init() {
        super.init(name: "Battleship", size: 4)
    }
}

class Cruiser: Ship {
    init() {
        super.init(name: "Cruiser", size: 3)
    }
}

class Submarine: Ship {
    init() {
        super.init(name: "Submarine", size: 3)
    }
}

class Destroyer: Ship {
    init() {
        super.init(name: "Destroyer", size: 2)
    }
}
