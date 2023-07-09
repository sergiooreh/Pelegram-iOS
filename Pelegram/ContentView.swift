//
//  ContentView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.07.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    
    var body: some View {
        LoginView()
            .environmentObject(network)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
