//
//  ContentView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.07.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: SplashViewModel
    
    var body: some View {
        switch(viewModel.screenIndex) {
        case ScreenEnum.LOGIN: LoginView(authViewModel: AuthViewModel())
        case ScreenEnum.MAIN: MainScreen()
        case ScreenEnum.SPLASH: SplashScreenView()
        default: SplashScreenView()
        }
    }
    
}
