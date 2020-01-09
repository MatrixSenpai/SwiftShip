//
//  File.swift
//  
//
//  Created by Mason Phillips on 1/9/20.
//

import Foundation

struct GameEngine {
    var playerOne: Player!
    var playerTwo: Player!
    
    enum PlayerTurn: Equatable {
        case one, two
        
        static prefix func !(l: PlayerTurn) -> PlayerTurn {
            return (l == .one) ? .two : one
        }
    }
    
    var stats    : StatisticsManager
    
    init(stats: StatisticsManager) {
        self.stats = stats
    }
    
    mutating func play() {
        selectPlayers()
        
        var turnFlag: PlayerTurn = .one
        
        while(true) {
            guard var targeter = ((turnFlag == .one) ? playerOne : playerTwo) else { fatalError("Players not set?") }
            guard var targetee = ((turnFlag == .one) ? playerTwo : playerOne) else { fatalError("Players not set?") }
            
            let location = targeter.turn()
            let wasHit = targetee.check(location: location)
            (wasHit) ? targeter.wasHit(location: location) : targeter.wasMiss(location: location)
            
            print("\(location): \((wasHit) ? "Hit!" : "Miss!")")
            turnFlag = !turnFlag
            
            sleep(2)
        }
    }
    
    mutating func selectPlayers() {
        playerOne = Player(player: Statistic(name: "Matrix"))
        playerTwo = Player(player: Statistic(name: "Computer"))
    }
}
