//
//  SessionManager.swift
//  Clothing_App
//
//  Created by NIBM on 2024-04-07.
//

import Foundation

class SessionManager {
    static let shared = SessionManager() // Singleton instance
    
    var username: String? // Username variable
    
    private init() {}
}
