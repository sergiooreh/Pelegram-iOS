//
//  RegistrationView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.07.2023.
// 

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            if authViewModel.isLoading {
                ProgressView()
            }
            VStack(spacing: 20) {
                Spacer()
                Text("Pelegram")
                MyTextField(title: "Email", text: $authViewModel.email)
                MyTextField(title: "Password", text: $authViewModel.password, isPassword: true)
                MyTextField(title: "Repeat Password", text: $authViewModel.repeatPassword, isPassword: true)
                
                Button("Sign Up", action: {
                    Task {
                        await authViewModel.register()
                    }
                })
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
                Spacer()
            }
            .padding()
        }
        .background(authViewModel.isLoading ? Color.gray.opacity(0.4) : Color.clear)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(authViewModel: AuthViewModel())
    }
}
