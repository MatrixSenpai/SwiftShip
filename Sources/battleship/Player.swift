//
//  File.swift
//  
//
//  Created by Mason Phillips on 1/9/20.
//

import Foundation

struct Player: CustomStringConvertible {
    var target   : TargetBoard    = TargetBoard()
    var placement: PlacementBoard = PlacementBoard()
    
    let player   : Statistic
    
    var description: String {
        var rtr = player.playerName + "\n"
        rtr += target.description + "\n"
        rtr += placement.description + "\n"
        
        return rtr
    }
    
    init(player: Statistic) {
        self.player = player
    }
    
    func place() {
    }
    
    mutating func turn() -> XYGrid {
        print("\u{001B}[2J")
        print(self)
        print("Target a location")
        
        var x: HorizontalGrid = .alpha
        var y: VerticalGrid = .one
        
        while(true) {
            print("Enter A-J")
            if let i = readLine(), let l = HorizontalGrid(i) {
                x = l
                break
            } else { print("Invalid location") }
        }
        
        while(true) {
            print("Enter 1-10")
            if let i = readLine(), let l = VerticalGrid(i) {
                y = l
                break
            } else { print("Invalid location") }
        }
        
        return XYGrid(x: x, y: y)
    }
    
    mutating func check(location: XYGrid) -> Bool {
        placement.target(location)
    }
    
    func wasHit(location: XYGrid) {
        
    }
    func wasMiss(location: XYGrid) {
        
    }
}
