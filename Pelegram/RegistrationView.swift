//
//  RegistrationView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.07.2023.
// 

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    
    var body: some View {
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
            TextField(
                "Repeat Password",
                text: $repeatPassword
            )
            Button("Sign Up", action: {
                
            })
        }
        .padding()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
