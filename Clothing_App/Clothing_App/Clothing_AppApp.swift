//
//  Clothing_AppApp.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-16.
//


import SwiftUI

@main
struct YourApp: App {
    @StateObject var viewModel = LoginViewModel() // Initialize LoginViewModel
    
    var body: some Scene {
        WindowGroup {
            NewLogin(viewModel: viewModel) // Inject LoginViewModel into LoginView
        }
    }
}
