//
//  FeedView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.07.2023.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var feedViewModel: FeedViewModel = FeedViewModel()
    let users = ["user1", "user1", "user1", "user1", "user1", "user1", "user1", "user1", "user1", "user1", "user1", "user1"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Pelegram")
                Spacer()
                Text("aaa@aaa.aaa")
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "message")
                }
                Button(action: {
                    
                }) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                }
            }
            .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(users, id: \.self) { item in
                        StoryRow(userName: item)
                    }
                }
            }
            .padding(.vertical, 20)
            ScrollView() {
                VStack() {
                    ForEach(feedViewModel.feedList, id: \.self) { item in
                        PostView(feed: item)
                    }
                }
            }
        }
        .task {
            await feedViewModel.getFeeds()
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
