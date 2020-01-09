//
//  File.swift
//  
//
//  Created by Mason Phillips on 1/4/20.
//

import Foundation

extension String {
    func `repeat`(_ times: Int, spacer: String = "") -> String {
        return Array(repeating: self, count: times).joined(separator: spacer)
    }
}

protocol MenuType where Self: CustomStringConvertible, Self: CaseIterable {
    static var menuTitle: String { get }
    var rawValue: Int { get }
    
    init?(rawValue: Int)
}

struct MenuHandler<T: MenuType> {
    func renderMenu() -> T {
        var rtr = ""
        
        rtr += T.menuTitle + "\n"
        rtr += "-".repeat(20) + "\n"
        
        for i in 0..<T.allCases.count {
            let opt = (T.allCases as! Array<T>)[i]
            rtr += "\(i + 1)) \(opt.description)\n"
        }
        
        rtr += "-".repeat(20) + "\n"
        print(rtr)
        
        while(true) {
            print("Make a selection")
            
            guard
                let input = readLine(),
                let selection = Int(input),
                let option = T(rawValue: selection - 1)
            else { print("Invalid selection"); continue }
            
            return option
        }
    }
}

enum MainMenu: Int, CaseIterable, CustomStringConvertible, MenuType {
    static var menuTitle: String = "Main Menu"
    
    case play, stats, settings, quit
    
    var description: String {
        switch self {
        case .play    : return "Play"
        case .stats   : return "Statistics"
        case .settings: return "Settings"
        case .quit    : return "Quit"
        }
    }
}
