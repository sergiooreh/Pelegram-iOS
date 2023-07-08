//
//  LoginView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.07.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack(spacing: 50) {
                    Text("Pelegram")
                    TextField(
                        "Email",
                        text: $email
                    )
                    TextField(
                        "Password",
                        text: $password
                    )
                    Button("Log in", action: {
                        
                    })
                }
                .padding()
                
                Spacer()
                
                NavigationLink{
                    RegistrationView()
                } label: {
                    Text("Don't have an account? Sign up")
                }
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
