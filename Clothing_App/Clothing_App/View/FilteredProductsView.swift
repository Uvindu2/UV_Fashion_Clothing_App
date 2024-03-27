//
//  FilteredProductsView.swift
//  Clothing_App
//
//  Created by NIBM-LAB04-PC04 on 2024-03-25.
//

import SwiftUI

struct FilteredProductsView: View {
    @ObservedObject var viewModel: ProductListViewModel
    
    var body: some View {
        List(viewModel.filterProducts(), id: \.id) { product in
            Text(product.name)
            Text("Category: \(product.category)")
            Text("Price: \(product.price)")
            // Add other product details as needed
        }
    }
}

