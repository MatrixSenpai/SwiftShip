//
//  File.swift
//  
//
//  Created by Mason Phillips on 1/4/20.
//

import Foundation
import LibSnowflake

struct StatisticsManager {
    let manager: FileManager = .default
    
    let encoder: JSONEncoder = JSONEncoder()
    let decoder: JSONDecoder = JSONDecoder()
    
    var stats  : [Statistic]
    
    init() {
        if let data = manager.contents(atPath: "./statistics.json") {
            do {
                let items = try decoder.decode(Array<Statistic>.self, from: data)
                stats = items
            } catch {
                stats = []
            }
        } else {
            stats = []
        }
    }
    
    func saveData() {
        if stats.count == 0 { return }
        
        do {
            let data = try encoder.encode(stats)
            
            if manager.fileExists(atPath: "./statistics.json") {
                
            } else {
                manager.createFile(atPath: "./statistics.json", contents: data, attributes: nil)
            }
            
        } catch let error {
            print(error.localizedDescription)
            exit(1)
        }
    }
    
    mutating func checkOrAddPlayer() {
        if stats.count == 0 {
            print("No players exist!")
            addPlayer()
        } else {
            listPlayers()
        }
    }
    
    mutating func addPlayer() {
        print("Adding a new player")
        
        var name: String = ""
        
        while(true) {
            print("What's your name?")
            if let n = readLine() {
                name = n
                break
            } else { print("Input not received. Try again!") }
        }
        
        let stat = Statistic(name: name)
        print("Added \(stat.playerName)")
        stats.append(stat)
    }
    
    func listPlayers() {
        
    }
    func playerDetails(by id: Snowflake) {
        
    }
    
    mutating func deletePlayer(by id: Snowflake) {
        
    }
}

struct Statistic: Codable, CustomStringConvertible {
    var playerId  : Snowflake
    var playerName: String
    var wins  : Float
    var losses: Float
    
    var description: String {
        var rtr = ""
        
        rtr += "\(playerName) (\(playerId)\n"
        rtr += "-".repeat(15)
        rtr += "\nWin Percentage: " + String(format: "%.2f%%", winper)
        rtr += "-".repeat(5)
        rtr += "\nWins  : \(Int(wins))"
        rtr += "\nLosses: \(Int(losses))"
        rtr += "\nTotal : \(Int(played))"
        
        return rtr
    }
    
    init(name: String) {
        playerId = Snowflake.generate()
        playerName = name
        wins = 0.0
        losses = 0.0
    }
    
    var winper: Float {
        return (wins / (wins + losses)) * 100
    }
    
    var played: Float {
        return wins + losses
    }
}
