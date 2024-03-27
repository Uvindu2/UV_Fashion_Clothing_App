//
//  LoginViewModel2.swift
//  Clothing_App
//
//  Created by NIBMPC04PC02 on 2024-03-27.
//

import Foundation
import Combine

class LoginViewModel2: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    func login(user: User2) -> Bool {
        // Perform authentication logic here
        // For demonstration, let's assume successful login if username and password match
        return user.username == username && user.password == password
    }
}

