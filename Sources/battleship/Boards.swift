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
        var board = Array(repeating: Array(repeating: "*", count: 10), count: 10)
        board = buildPositionMisses(board: board)
        board = buildPositionShips(board: board)
        
        var rtr = "+---".repeat(10) + "+\n"
        
        for row in board {
            rtr += "+"
            for i in 0..<row.count {
                rtr += " \(row[i])"
                rtr += (i == (row.count - 1) ? " +\n" : "  ")
            }
//            rtr += "+\n"
        }
        
        rtr += "+---".repeat(10) + "+\n"
        
        return rtr
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
    
    func buildPositionMisses(board: [[String]]) -> [[String]] {
        var mutable = board
        for position in misses {
            mutable[position.x.rawValue][position.y.rawValue] = "O"
        }
        return mutable
    }
    func buildPositionShips(board: [[String]]) -> [[String]] {
        var mutable = board
        
        for (_, ship) in ships {
            var loc = ship.location
            for _ in 0..<ship.size {
                mutable[loc!.grid.x.rawValue][loc!.grid.y.rawValue] = "O"
                loc = loc!.next()
            }
            
            for hit in ship.hit {
                mutable[hit.grid.x.rawValue][hit.grid.y.rawValue] = "X"
            }
        }
        
        return mutable
    }
}

struct TargetBoard: CustomStringConvertible {
    var hits  : [XYGrid] = []
    var misses: [XYGrid] = []
    
    var description: String {
        return ""
    }
}
