//
//  TextField.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 09.07.2023.
//

import SwiftUI

struct MyTextField: View {
    var title: String
    @Binding  var text: String
    
    var body: some View {
        TextField(
            title,
            text: $text
        )
        .autocapitalization(.none)
        .padding(.all)
        .border(Color(UIColor.separator))
        .padding(.all)
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        MyTextField(title:"Email", text: .constant(""))
    }
}
