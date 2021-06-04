//
//  swiftui_guessing_number_gameApp.swift
//  swiftui-guessing-number-game
//
//  Created by Sam on 2021-06-04.
//

import SwiftUI

@main
struct swiftui_guessing_number_gameApp: App {
    
    @StateObject var gameManager = GameManager() //call by reference

    var body: some Scene {
        WindowGroup {
            GameView(gameManager: gameManager)
        }
    }
}
