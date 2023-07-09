//
//  FeedView.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 07.07.2023.
//

import SwiftUI

struct FeedView: View {
    let disciplines = ["statue", "mural", "plaque"]
    
    var body: some View {
        //The argument \.self tells List that each item is identified by itself. This is allowed, as long as the item’s type conforms to the Hashable protocol, which all the built-in types do.
        NavigationView {
          List(disciplines, id: \.self) { discipline in
            Text(discipline)
          }
          .navigationBarTitle("Disciplines")
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
