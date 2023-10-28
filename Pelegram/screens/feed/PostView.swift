//
//  PostView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 27.10.2023.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                        .foregroundColor(.black)
                Text("Title?")
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }
            }
            Image("logo")
                .scaledToFit()
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
            Text("aaa@aaa.aaa: hi")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

#Preview {
    PostView()
}
