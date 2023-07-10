//
//  AuthUserDto.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 09.07.2023.
//

import Foundation

struct AuthUserDto: Decodable {
    var id: String
    var email: String
    var chats: Dictionary<String, String>
}
