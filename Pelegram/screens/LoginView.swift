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
    
    @State private var isFeedViewPresented = false
    @State private var showingAlert = false
    
    private let requestManager = RequestManager()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    Text("Pelegram")
                    MyTextField(title: "Email", text: $email)
                    MyTextField(title: "Password", text: $password)
                    Button("Log in") {
                        if(email.isEmpty || password.isEmpty) {
                            showingAlert = true
                        } else {
                            Task {
                                await login()
                            }
                        }
                    }
                    .sheet(isPresented: $isFeedViewPresented) {
                        FeedView()
                    }
                    .alert("Please fill all text fields", isPresented:$showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
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
    
    func login() async {
        do {
            let loginResponse: BasicDataResponse<LoginResponse> = try await requestManager.perform(LoginRequest.login(email: email, password: password))
            print(loginResponse)
//            let animals = animalsContainer.animals
//            self.animals = animals
//            await stopLoading()
        } catch {
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
