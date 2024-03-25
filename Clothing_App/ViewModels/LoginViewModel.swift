//
//  LoginViewModel.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-22.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    func login() -> Bool {
        // Implement your login logic here
        // For demonstration purposes, let's just check if username and password are not empty
        return !username.isEmpty && !password.isEmpty
    }
}

