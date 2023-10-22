//
//  LoginRequest.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 09.07.2023.
//

enum LoginRequest: RequestProtocol {
    case login(email: String, password: String)
    
    var path: String {
        "/login"
    }
    
    var addAuthorizationToken: Bool {
        false
    }
    
    var params: [String: Any] {
        switch self {
        case let .login(email, password):
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
