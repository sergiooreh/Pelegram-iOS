//
//  MainScreen.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 28.10.2023.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        TabView{
            FeedView()
                .tabItem{
                    Label("Feed",systemImage: "house")
                }
            Text("Create Feed")
                .tabItem{
                    Label("Create",systemImage: "plus")
                }
        }
    }
}

#Preview {
    MainScreen()
}
