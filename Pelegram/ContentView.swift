//
//  ContentView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.07.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: MyViewModel
    
    var body: some View {
        switch(viewModel.screenIndex) {
        case 0: LoginView()
        case 1: FeedView()
        case 2: SplashScreenView()
        default: SplashScreenView()
        }
    }
    
    
}
