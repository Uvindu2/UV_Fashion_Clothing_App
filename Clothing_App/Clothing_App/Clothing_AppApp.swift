//
//  Clothing_AppApp.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC05 on 2024-03-16.
//


import SwiftUI

@main
struct YourApp: App {
    @StateObject var viewModel = LoginViewModel2() // Initialize LoginViewModel
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Inject LoginViewModel into LoginView
        }
        
    }
}
