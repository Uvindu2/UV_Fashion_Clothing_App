//
//  ProductListViewModel.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC04 on 2024-03-25.
//

import Foundation
class ProductListViewModel: ObservableObject {
    @Published var products: [Product]
    @Published var selectedCategory: String?
    @Published var selectedPriceRange: ClosedRange<Double>?
    // Add other filter properties as needed
    
    init(products: [Product]) {
        self.products = products
    }
    
    func filterProducts() -> [Product] {
        var filteredProducts = products
        
        if let category = selectedCategory {
            filteredProducts = filteredProducts.filter { $0.category == category }
        }
        
        // Add other filters as needed
        
        return filteredProducts
    }
}
