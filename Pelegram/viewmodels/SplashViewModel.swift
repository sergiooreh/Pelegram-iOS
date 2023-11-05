//
//  MyViewModel.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 14.07.2023.
//

import Foundation

class SplashViewModel: ObservableObject {
    @Published var screenIndex: ScreenEnum = ScreenEnum.SPLASH
    private let requestManager = RequestManager()
    
    func authenticate() async {
        do {
            let authResponse: BasicDataResponse<AuthUserDto> = try await requestManager.perform(AuthenticateRequest.authenticate)
            
            print(authResponse)
            
            if(!authResponse.data.id.isEmpty) {
                screenIndex = ScreenEnum.MAIN
            } else {
                screenIndex = ScreenEnum.LOGIN
            }
        } catch {
            print(error)
            screenIndex = ScreenEnum.LOGIN
        }
    }
    
}
