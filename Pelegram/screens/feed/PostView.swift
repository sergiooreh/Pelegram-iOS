//
//  PostView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 27.10.2023.
//

import SwiftUI

struct PostView: View {
    var feed: FeedDto
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .foregroundColor(.black)
                Text(feed.title)
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }
            }
            AsyncImage(url: URL(string: feed.imageUrl ?? "")) { phase in
                switch phase {
                case .success(let image):
                    // This is displayed when the image is successfully loaded.
                    image
                        .resizable()
                        .scaledToFit()
                case .empty, .failure(_):
                    // This is displayed if the image fails to load.
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                @unknown default:
                    // Handle any future cases here
                    EmptyView()
                }
            }.scaledToFit()
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.black)
                }
                Button(action: {
                    
                }) {
                    Image(systemName: "pencil")
                        .foregroundColor(.black)
                }
                Button(action: {
                    
                }) {
                    Image(systemName: "paperplane")
                        .foregroundColor(.black)
                }
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "checkmark")
                        .foregroundColor(.black)
                }
            }
            Text("0 likes")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            Text("\(feed.creator): \(feed.description ?? "")")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

//#Preview {
//    PostView()
//}
