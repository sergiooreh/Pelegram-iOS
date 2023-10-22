//
//  MyViewModel.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 14.07.2023.
//

import Foundation

class MyViewModel: ObservableObject {
    @Published var screenIndex: Int = 2
    private let requestManager = RequestManager()
    
    func authenticate() async {
        do {
            let authResponse: BasicDataResponse<AuthUserDto> = try await requestManager.perform(AuthenticateRequest.authenticate)
            
            print(authResponse)
            
            if(!authResponse.data.id.isEmpty) {
                screenIndex = 1
            } else {
                screenIndex = 0
            }
        } catch {
            print(error)
            screenIndex = 0
        }
    }
    
}
