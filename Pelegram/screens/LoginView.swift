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
                    MyTextField(title: "Password", text: $password, isPassword: true)
                    Button("Log in") {
                        if(email.isEmpty || password.isEmpty) {
                            showingAlert = true
                        } else {
                            Task {
                                await login()
                            }
                        }
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
                
                
                NavigationLink("", destination: FeedView(), isActive: $isFeedViewPresented)
                                    .hidden()
            }
        }
        
    }
    
    func login() async {
        do {
            let loginResponse: BasicDataResponse<LoginResponse> = try await requestManager.perform(LoginRequest.login(email: email, password: password))
            print(loginResponse)
            UserDefaults.standard.set(loginResponse.data.token, forKey: Constants.USER_TOKEN)
            isFeedViewPresented = true
        } catch {
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
