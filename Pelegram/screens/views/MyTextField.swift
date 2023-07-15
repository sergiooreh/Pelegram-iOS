//
//  TextField.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 09.07.2023.
//

import SwiftUI

struct MyTextField: View {
    var title: String
    @Binding var text: String
    var isPassword: Bool = false
    
    var body: some View {
        if isPassword {
            SecureField(title, text: $text)
                .modifier(TextFieldModifier())
        } else {
            TextField(title, text: $text)
                .modifier(TextFieldModifier())
        }
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
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
