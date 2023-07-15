//
//  PelegramApp.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.07.2023.
//

import SwiftUI

@main
struct PelegramApp: App {
    @StateObject private var viewModel = MyViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .task {
                    await viewModel.authenticate()
                }
        }
    }
}
