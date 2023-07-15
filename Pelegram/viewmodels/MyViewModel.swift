//
//  MyViewModel.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 14.07.2023.
//

import Foundation

class MyViewModel: ObservableObject {
    @Published var screenIndex: Int = 0
    private let requestManager = RequestManager()
    
    func authenticate() async {
        do {
            let loginResponse: BasicDataResponse<LoginResponse> = try await requestManager.perform(AuthenticateRequest.authenticate)
            
            print(loginResponse)
            let userToken: String? = loginResponse.data.token
            
            if(userToken != nil) {
                UserDefaults.standard.set(loginResponse.data.token, forKey: Constants.USER_TOKEN)
                screenIndex = 1
            } else {
                screenIndex = 0
            }
        } catch {
        }
    }
    
}
