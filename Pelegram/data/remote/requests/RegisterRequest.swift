//
//  LoginRequest.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 09.07.2023.
//

enum RegisterRequest: RequestProtocol {
    case register(email: String, password: String)
    
    var path: String {
        "/register"
    }
    
    var params: [String: Any] {
        switch self {
        case let .register(email, password):
            var params: [String: Any] = [:]
            if !email.isEmpty {
                params["email"] = email
            }
            if !password.isEmpty {
                params["password"] = password
            }
            
            return params
        }
    }
    
    var requestType: RequestType {
        .POST
    }
}
