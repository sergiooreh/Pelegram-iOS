//
//  PelegramApp.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.07.2023.
//

import SwiftUI

@main
struct PelegramApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
