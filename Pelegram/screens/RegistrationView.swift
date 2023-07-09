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
        VStack(spacing: 20) {
            Text("Pelegram")
            MyTextField(title: "Email", text: $email)
            MyTextField(title: "Password", text: $password)
            MyTextField(title: "Repeat Password", text: $repeatPassword)
            
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
