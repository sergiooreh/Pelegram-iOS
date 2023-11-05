//
//  AuthViewModel.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 04.11.2023.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var email = ""
    @Published var password = ""
    @Published var repeatPassword = ""
    @Published var error: String? = nil
    @Published var isScreenMain = false
    private let requestManager = RequestManager()
    
    
    func login() async {
        if(email.isEmpty || password.isEmpty) {
            error = "Please fill all text fields"
            return
        }
        isLoading = true
        
        do {
            let loginResponse: BasicDataResponse<LoginResponse> = try await requestManager.perform(LoginRequest.login(email: email, password: password))
            print(loginResponse)
            await MainActor.run {
                if(loginResponse.successful) {
                    UserDefaults.standard.set(loginResponse.data.token, forKey: Constants.USER_TOKEN)
                    isScreenMain = true
                } else {
                    error = loginResponse.message
                }
                isLoading = false
            }
        } catch let error {
            await MainActor.run {
                self.error = error.localizedDescription
                isLoading = false
            }
        }
    }
    
    func register() async {
        if(email.isEmpty || password.isEmpty || repeatPassword.isEmpty) {
            error = "Please fill all text fields"
            return
        }
        if(password != repeatPassword) {
            error = "Passwords must be match"
            return
        }
        isLoading = true
        
        do {
            let registerResponse: BasicApiResponse = try await requestManager.perform(RegisterRequest.register(email: email, password: password))
            print(registerResponse)
            await MainActor.run {
                if(registerResponse.successful) {
                    
                }
                isLoading = false
            }
            
        } catch {
            await MainActor.run {
                self.error = error.localizedDescription
                isLoading = false
            }
        }
    }
}
