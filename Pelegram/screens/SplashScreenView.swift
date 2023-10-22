//
//  SplashScreenView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 15.07.2023.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "hare.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                Text("Pelegram")
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
        }
    }
    
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
