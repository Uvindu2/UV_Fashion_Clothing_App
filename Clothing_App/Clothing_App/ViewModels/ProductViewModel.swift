//
//  ProductViewModel.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC04 on 2024-03-25.
//


import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var selectedProduct: Product?
    @Published var shouldNavigate: Bool = false
    var productList: [Product] = []
    
    func fetchProductsFromAPI() {
        guard let url = URL(string: "https://uv-fashion.onrender.com/api/products/") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching products: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                self.productList = products
                print("Products fetched successfully")
            } catch {
                print("Error decoding products: \(error)")
            }
        }.resume()
    }


}


