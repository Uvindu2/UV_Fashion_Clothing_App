//
//  LoginViewModel2.swift
//  Clothing_App
//
//  Created by NIBMPC04PC02 on 2024-03-27.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    func login(user: User) -> Bool {
        // Perform authentication logic here
        // For demonstration, let's assume successful login if username and password match
        return user.username == "Uvindu" && user.password == "123"
    }
    
    func signUp(username: String, password: String) {
        // Validate username and password
        guard !username.isEmpty else {
            print("Please enter a username")
            return
        }
        guard !password.isEmpty else {
            print("Please enter a password")
            return
        }
        
        // Create JSON data from username and password
        let json: [String: Any] = [
            "username": username,
            "password": password
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json)
            
            // Create URL request
            guard let url = URL(string: "https://uv-fashion.onrender.com/api/users") else {
                print("Invalid URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            // Perform the API call
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error signing up: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                // Handle the response from the server if needed
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response JSON: \(jsonResponse)")
                } catch {
                    print("Error decoding response: \(error)")
                }
            }.resume()
        } catch {
            print("Error creating JSON data: \(error)")
        }
    }

}

