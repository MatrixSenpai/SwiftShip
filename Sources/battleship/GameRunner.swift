//
//  File.swift
//  
//
//  Created by Mason Phillips on 1/4/20.
//

import Foundation

class GameRunner {
    let menu   = MenuHandler<MainMenu>()
    var stats  = StatisticsManager()
    var engine: GameEngine
    
    init() {
        engine = GameEngine(stats: stats)
    }
    
    func run() {
        while(true) {
            print("\u{001B}[2J")
            let selection = menu.renderMenu()
            
            switch selection {
            case .quit: runExit()
            case .play: engine.play()
            case .stats: stats.checkOrAddPlayer()
            case .settings:
                break
            }
        }
    }
    
    func runExit() {
        stats.saveData()
        
        
        exit(0)
    }
}
