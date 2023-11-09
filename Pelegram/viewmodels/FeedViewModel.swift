//
//  FeedViewModel.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.11.2023.
//

import Foundation
import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var feedList: [FeedDto] = []
    @Published var isLoading = false
    @Published var error: String? = nil
    @Published var isScreenLogin = false
    private let requestManager = RequestManager()
    
    
    func getFeeds() async {
        isLoading = true
        
        do {
            let getFeedsResponse: BasicDataResponse<[FeedDto]> = try await requestManager.perform(GetFeedsRequest.getFeeds(page: 1, pageSize: 4))
            print(getFeedsResponse)
            await MainActor.run {
                if(getFeedsResponse.successful) {
                    feedList = getFeedsResponse.data
                } else {
                    error = getFeedsResponse.message
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
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: Constants.USER_TOKEN)
        isScreenLogin = true
    }
}
