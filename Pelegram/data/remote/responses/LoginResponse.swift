//
//  LoginResponse.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 09.07.2023.
//

import Foundation

struct LoginResponse: Decodable {
    var user: AuthUserDto
    var token: String
}
