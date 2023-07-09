//
//  Network.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 08.07.2023.
//

import Foundation

class Network: ObservableObject {
    @Published var user: User? = nil
    
    func login(email: String, password: String) {
        guard let url = URL(string: "\(Constants.BASE_URL)/login") else { fatalError("Missing URL") }

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let loginRequest = LoginRequest(email: email, password: password)
        if let encoded = try? encoder.encode(loginRequest) {
            urlRequest.httpBody = encoded
        }
        //URLSession methods are asynchronous: They dispatch their work onto another queue and immediately return control to the main queue,
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let dataResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                        print(dataResponse.self)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
