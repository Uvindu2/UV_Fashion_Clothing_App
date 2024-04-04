//
//  RegistrationViewModel.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC04 on 2024-03-23.
//

import Foundation
class RegistrationViewModel: ObservableObject {
    @Published var user: User = User(username: "",password: "")
    @Published var registrationSuccess = false
    
    func register() {
        // Here you can implement the registration logic
        // For demonstration purposes, let's assume registration is successful
        print("Registering user:", user)
        registrationSuccess = true
    }
}
