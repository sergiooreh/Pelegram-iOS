//
//  LoginRequest.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 09.07.2023.
//

enum AuthenticateRequest: RequestProtocol {
    case authenticate
    
    var path: String {
        "/authenticate"
    }
    
    var requestType: RequestType {
        .GET
    }
}
