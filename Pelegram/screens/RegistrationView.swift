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
    
    @State private var showingAlert = false
    
    private let requestManager = RequestManager()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Pelegram")
            MyTextField(title: "Email", text: $email)
            MyTextField(title: "Password", text: $password)
            MyTextField(title: "Repeat Password", text: $repeatPassword)
            
            Button("Sign Up", action: {
                if(email.isEmpty || password.isEmpty || repeatPassword.isEmpty) {
                    showingAlert = true
                    return
                }
                if(password.isEmpty != repeatPassword.isEmpty) {
                    showingAlert = true
                    return
                }
                Task {
                    await register()
                }
            })
            .alert("Please fill all text fields", isPresented:$showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .padding()
    }
    
    func register() async {
        do {
            let registerResponse: BasicApiResponse = try await requestManager.perform(RegisterRequest.register(email: email, password: password))
            print(registerResponse)
//            let animals = animalsContainer.animals
//            self.animals = animals
//            await stopLoading()
        } catch {
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
