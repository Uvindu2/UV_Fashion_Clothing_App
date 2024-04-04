//
//  TabViewModel.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC04 on 2024-03-25.
//

import Foundation
class TabViewModel: ObservableObject {
    // Data properties
    @Published var selectedTab: Int = 0
    
    // Functions to handle user interactions
    func selectTab(_ tab: Int) {
        selectedTab = tab
    }
}
