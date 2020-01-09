import Foundation

let menu   = MenuHandler<MainMenu>()
var stats  = StatisticsManager()
let engine = GameRunner()

engine.run()
