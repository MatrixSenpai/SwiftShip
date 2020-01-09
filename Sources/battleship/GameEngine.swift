//
//  File.swift
//  
//
//  Created by Mason Phillips on 1/4/20.
//

import Foundation

class GameEngine {
    let menu  = MenuHandler<MainMenu>()
    var stats = StatisticsManager()
    
    func run() {
        while(true) {
            let selection = menu.renderMenu()
            
            switch selection {
            case .quit: runExit()
            case .play:
                break
            case .stats:
                stats.checkOrAddPlayer()
            case .settings:
                break
            }
        }
    }
    
    func play() {
        
    }
    
    func runExit() {
        stats.saveData()
        
        
        exit(0)
    }
}
