//
//  LoginRequest.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 08.07.2023.
//

import Foundation

struct LoginRequest: Encodable {
    var email: String
    var password: String
}
