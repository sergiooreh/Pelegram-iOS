//
//  StoryRow.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 24.10.2023.
//

import SwiftUI

struct StoryRow: View {
    let userName: String
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                    .foregroundColor(.black)
            Text(userName)
        }
    }
}
