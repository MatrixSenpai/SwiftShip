//
//  File.swift
//  
//
//  Created by Mason Phillips on 1/4/20.
//

import Foundation

struct PlacementBoard: CustomStringConvertible {
    var ships: [ShipType: Ship] = [:]
    
    var misses: [XYGrid] = []
    
    var description: String {
        return ""
    }
    
    mutating func target(_ location: XYGrid) -> Bool {
        for (_, ship) in ships {
            if ship.isInLocation(location) { return true }
        }
        
        misses.append(location)
        return false
    }
    
    mutating func place() {
        let carrier = Carrier()
        _ = carrier.place(letter: .alpha, number: .one, orientation: .horizontal)
        ships[.carrier] = carrier
        
        let battle = Battleship()
        _ = battle.place(letter: .bravo, number: .one, orientation: .horizontal)
        ships[.battleship] = battle
        
        let cruiser = Cruiser()
        _ = cruiser.place(letter: .charlie, number: .one, orientation: .horizontal)
        ships[.cruiser] = cruiser
                
        let submarine = Submarine()
        _ = submarine.place(letter: .delta, number: .one, orientation: .horizontal)
        ships[.submarine] = submarine
        
        let destroyer = Destroyer()
        _ = destroyer.place(letter: .echo, number: .one, orientation: .horizontal)
        ships[.destroyer] = destroyer
    }
}

struct TargetBoard: CustomStringConvertible {
    var hits  : [XYGrid] = []
    var misses: [XYGrid] = []
    
    var description: String {
        return ""
    }
}
