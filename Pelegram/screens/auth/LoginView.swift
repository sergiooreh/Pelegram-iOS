//
//  LoginView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.07.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                if authViewModel.isLoading {
                    ProgressView()
                }
                VStack {
                    Spacer()
                    VStack(spacing: 20) {
                        Text("Pelegram")
                        MyTextField(title: "Email", text: $authViewModel.email)
                        MyTextField(title: "Password", text: $authViewModel.password, isPassword: true)
                        Button("Log in") {
                            Task {
                                await authViewModel.login()
                            }
                        }
                        .alert(isPresented: Binding<Bool>(
                            get: { authViewModel.error != nil },
                            set: { newValue in
                                authViewModel.error = nil
                            }
                        )) {
                            Alert(
                                title: Text("Error"),
                                message: Text(authViewModel.error ?? ""),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    NavigationLink{
                        RegistrationView(authViewModel: AuthViewModel())
                    } label: {
                        Text("Don't have an account? Sign up")
                    }
                    
                    
                    NavigationLink("", destination: MainScreen(), isActive: $authViewModel.isScreenMain)
                        .hidden()
                }
            }
            .background(authViewModel.isLoading ? Color.gray.opacity(0.4) : Color.clear)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authViewModel: AuthViewModel())
    }
}
