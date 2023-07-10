//
//  LoginResponse.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 08.07.2023.
//

import Foundation

struct BasicApiResponse<T: Decodable>: Decodable {
    var successful: Bool
    var message: String
    var data: T
}
