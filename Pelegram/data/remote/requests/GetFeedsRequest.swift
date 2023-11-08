//
//  LoginRequest.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 09.07.2023.
//

enum GetFeedsRequest: RequestProtocol {
    case getFeeds(page: Int, pageSize: Int?)
    
    var path: String {
        "/getFeeds"
    }
    
    var addAuthorizationToken: Bool {
        true
    }
    
    var urlParams: [String: Any] {
        switch self {
        case let .getFeeds(page, pageSize):
            var params: [String: Any] = [:]
            params["page"] = page
//            if !pageSize != nil {
//                params["pageSize"] = pageSize
//            }
            params["pageSize"] = pageSize
            
            return params
        }
    }
    
    var requestType: RequestType {
        .GET
    }
}
